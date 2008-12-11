/*
header file for upaccho2 webserver. 
7 May 2005 Junichi Uekawa
*/

#ifndef __UPACCHO2WEBSERVICE_H__
#define __UPACCHO2WEBSERVICE_H__

void http_404(int sock);
void http_header(int sock, const char* contenttype);
void* http_add_handler(const char* path,
		      void (*func)(int, const char*, const char*));
int http_initiate_webserver(int portnumber);

#endif 
