/*BINFMTC: upaccho2-webservice.c  -L /usr/X11R6/lib -lXt -lXtst
exit 1

A HTTP-based button system for iPod Touch.
Remote control your X session.
Copyright 2008,2009 Junichi Uekawa

A simple webserver in C.
7 May 2005 Junichi Uekawa

Based on:
A quick and dirty webserver that does almost nothing.
23 feb 2001 Junichi Uekawa

*/

#include "upaccho2-webservice.h"

#include <X11/Xlib.h>
#include <X11/extensions/XTest.h>
#include <fcntl.h>
#include <netdb.h>
#include <netinet/in.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <unistd.h>

/* Xtest key code for PgUp and PgDn keys. */
const int KEY_PGUP=99;
const int KEY_PGDOWN=105;

/* The X Display */
Display *display = NULL;

/* Xtest code to type in a key. Emulates press down and then
   release. sched_yield is there to cause a bit of timeslicing but I'm not
   quite sure if it's really sufficient or necessary. */
void xkeyboardevent(int key)
{
  XTestFakeKeyEvent(display, key, 1, 0);
  XSync(display, 0);
  sched_yield();

  XTestFakeKeyEvent(display, key, 0, 0);
  XSync(display, 0);
  sched_yield();
}

/* Output the template HTML, which shows the Up and Down png file. */
void output_html(int sock)
{
  FILE*f;
  http_header(sock, "text/html");
  f=fdopen(sock,"w");
  fprintf(f,
	  "<html><header><title>HTTP Buttons by dancerj</title></header>\n"
	  "<body><h1>HTTP Buttons by dancerj</h1>"
	  "<a href=up><img src=up.png width=80%%></a><br>"
	  "<a href=down><img src=down.png width=80%%></a>"
	  "</body></html>\n");
  fclose(f);
}

/* Handler when 'up' or 'down' button is pressed; show the HTML page, and emulate PgUp/PgDn */
void move_up(int sock)
{
  printf("move up!\n");
  output_html(sock);
  xkeyboardevent(KEY_PGUP);		/* page up */
}

void move_down(int sock)
{
  printf("move down!\n");
  output_html(sock);
  xkeyboardevent(KEY_PGDOWN);		/* page down */
}

/*
   Show a png file. Expects the data to be in the current directory.
   Currently, up.png and down.png only.
 */
void dump_png(int sock, const char* filename)
{
  int fd=open(filename, O_RDONLY);
  const int PNGBUFSIZ=4096;	/* you know the png size beforehand. */
  int len;
  char buf[PNGBUFSIZ];

  if (fd == -1)
    {
      fprintf(stderr, "cannot open [%s]\n", filename);
      perror("open");
      exit(1);
    }

  len=read(fd,buf,PNGBUFSIZ);
  http_header(sock, "image/png");
  write(sock,buf,len);
  close(fd);
}

/*
   The main HTTP handler.

   Will receive call every time HTTP request comes.

   This will serve the initial '/' page, and 'up' and 'down' HTML
   pages, and also 'up.png', 'down.png' png files.
 */
void handler(int sock, const char* path, const char* filename)
{
  if (!strcmp(filename, ""))
    {				/* initial page */
      output_html(sock);
    }
  else if (!strcmp(filename, "up"))
    {
      move_up(sock);
    }
  else if (!strcmp(filename, "down"))
    {
      move_down(sock);
    }
  else if (!strcmp(filename, "up.png") || !strcmp(filename, "down.png"))
    {
      dump_png(sock, filename);
    }
  else
    {
      printf("Unknown filename [%s]!\n", filename);
    }
}


int main(int ac, char** av)
{
  if (ac != 2)
    {
      fprintf(stderr, "Please specify the port as the command-line parameter\n");
      exit(1);
    }

  /* initialize X */
  display=XOpenDisplay(NULL);

  if(!display)
    {
      fprintf(stderr, "Cannot open display\n");
      return;
    }

  /* initialize HTTP handler */
  http_add_handler("/", handler);
  http_initiate_webserver(atoi(av[1]));
  return 0;
}

