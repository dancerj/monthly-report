/*BINFMTC: -DTESTUPACCHOWEBSERVER

A simple webserver in C.
7 May 2005 Junichi Uekawa

Based on:
A quick and dirty webserver that does almost nothing.
23 feb 2001 Junichi Uekawa

*/
#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <pthread.h>
#include "upaccho2-webservice.h"

#define MAXHOSTNAMELEN 256	/* max hostname len per manpage  */
#define BACKLOG 256		/* max backlog to listen to */

#define TMPBUFSIZE 2048		/* length of incoming command to accept */

const char* servername="Upaccho Webserver";

void http_404(int sock)
{
  const char* errormessage=
    "HTTP/1.1 404 File not found\n" 
    "Server: %s\n"
    "Content-Type: text/html\n\n"
    "<html><head><title>404 File not found</title></head>"
    "<body><h1>404 File not found</h1></body></html>\n";
  char* buf=NULL;
  
  asprintf(&buf, errormessage, servername);
  if (buf)
    {
      write(sock, buf, strlen(buf));
      free(buf);
    }
}

void http_header(int sock, const char* contenttype)
{
  const char* message= 
    "HTTP/1.1 200 OK\n" 
    "Server: %s\n"
    "Content-Type: %s\n\n";
  char* buf=NULL;
  
  asprintf(&buf, message, servername, contenttype);
  if (buf)
    {
      write(sock, buf, strlen(buf));
      free(buf);
    }
}

struct urlhandlers_t
{
  char* path;
  void (*func)(int fd, const char* fullpath, const char* param);
  struct urlhandlers_t* next;
};

/* need lock for multithread writes, should not need one for read? */
static pthread_mutex_t urlhandlers_lock=PTHREAD_MUTEX_INITIALIZER;

static struct urlhandlers_t* urlhandlers=NULL; /* There is no deletion function for this;
						which makes things easier*/

/**
   Register a handler.

   Ones registered later will override the ones registered before.
 */
void* http_add_handler(const char* path,
		      void (*func)(int, const char*, const char*))
{
  struct urlhandlers_t* u=malloc(sizeof(struct urlhandlers_t));
  if (!u)
    return NULL;
  if (!path || !func)
    return NULL;

  u->path=strdup(path);
  u->func=func;
  pthread_mutex_lock(&urlhandlers_lock); /* the two lines interrupted is not a good idea for 
					    http_add_handler; 
					    lock it. */
  u->next=urlhandlers;
  urlhandlers=u;		/* NB: this line must be atomic for http_find_handler to work.
				   real i386 is non-atomic for this line; which might be a 
				   problem.
				 */
  pthread_mutex_unlock(&urlhandlers_lock);
  return u;
}

/**
   function to find the http handler.

   This should be fast enough, but if there are too many handlers, it might be better to 
   have a hash function than searching linearly.
 */
static void http_find_handler(int sock, const char* path)
{
  struct urlhandlers_t* u=urlhandlers;

  while(u)
    {
      if (!strncmp(u->path,path,strlen(u->path)))
	{
	  u->func(sock, path, path+strlen(u->path));
	  return;
	}
      u=u->next;
    }
  /* could not find a match */
  http_404(sock);
}

static void handle_incoming(int sock)
{
  static char buf[TMPBUFSIZE+2] ;	/* incoming buffer */
  char* buf_processed=NULL;
  char* htmlversion=NULL;
  int i;
  
  if ((i=read(sock, buf, TMPBUFSIZE))<=0)
    return ;
  buf[i]=0;
  printf ("\nRequest:\n%s\n", buf);

  if (strlen (buf) > 4)
    {
      switch (sscanf (buf, "GET %as %as", &buf_processed, &htmlversion))
	{
	case 1:
	case 2:
	  http_find_handler(sock, buf_processed);
	  free(buf_processed);
	  if(htmlversion) free(htmlversion);
	  break;
	default:
	  /* your request is non-understandable for me */
	  http_404(sock);
	  break;
	}
    }
}

int http_initiate_webserver(int portnumber)
{
  char localhostname [MAXHOSTNAMELEN + 1] ;
  struct sockaddr_in sa, tmpisa;
  int incoming_socket;		/* the main waiting socket */
  int t;			/* new incoming calls */
  struct hostent *hp;
  int i;
  
  puts ("Upaccho web server version 0.0.1\n"
	"copyright 2001,2005 Junichi Uekawa\n");
  gethostname (localhostname, MAXHOSTNAMELEN) ;
  if ((hp = gethostbyname(localhostname)) == NULL)
    {
      fprintf(stderr, "cannot get localhost info\n");
      exit (1);
    }
  if ((incoming_socket = socket (hp->h_addrtype, SOCK_STREAM, 0 )) == -1 )
    {
      perror  ("socket");
      exit (1);      
    }

  sa.sin_port = htons(portnumber);	/* this should hopefully be portable */
  sa.sin_addr.s_addr= htonl(INADDR_ANY); /* should it be like this? it's 0 in linux */
  sa.sin_family = hp->h_addrtype;
  
  if (bind(incoming_socket, (struct sockaddr*)&sa, sizeof(sa)) < 0  ) 
    {
      perror("bind");
      exit(1);
    }
  listen(incoming_socket, BACKLOG);
  while(1)			/* this is a never-terminating loop
				 */
    {
      i=sizeof (tmpisa);
      if ((t = accept(incoming_socket, (struct sockaddr*)&tmpisa, &i )) == -1)
	{
	  perror ("accept");
	  exit (1);
	}
      /* we are processing one request at a time, feel free to use fork/pthread here */
      handle_incoming(t);
      close(t);			/* close it just to make sure. */
    }
}

#ifdef TESTUPACCHOWEBSERVER
void example_handler(int sock, const char* fullpath, const char* param)
{
  FILE*f;
  http_header(sock, "text/html");
  f=fdopen(sock,"w");
  fprintf(f, 
	  "<html><header><title>%s</title></header>\n"
	  "<body><h1>%s</h1><p>%s</p></body></html>\n",
	  param, param, fullpath);
  fclose(f);
}

int main(int ac, char** av)
{
  if (ac != 2)
    {
      fprintf(stderr, "Please specify the port as the command-line parameter\n");
      exit(1);
    }
  http_add_handler("/test/", example_handler);
  http_add_handler("/othr/", example_handler);
  http_initiate_webserver(atoi(av[1]));
  return 0;
}
#endif
