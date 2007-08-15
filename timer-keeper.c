/*BINFMTC: $(pkg-config --cflags --libs gtk+-2.0)
 */
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <gtk/gtk.h>
#include <locale.h>
#include <time.h>

time_t start_time, time_max;

typedef struct datastruct
{
  GtkWidget * progress;
  GtkWidget * text;
} datastruct;

static gint delete_event (GtkWidget * w, GdkEvent * e, gpointer data)
{				/* I will be deleted */
  return FALSE;  
}

static gint destroy_callback (GtkWidget * w, gpointer data)
{
  gtk_main_quit();
  return 0;  
}

void
CreateItems(datastruct * ds, GtkWidget *vbox)
{
  ds->progress = gtk_progress_bar_new();
  gtk_progress_bar_set_bar_style(GTK_PROGRESS_BAR (ds->progress), GTK_PROGRESS_CONTINUOUS);
  gtk_progress_set_format_string(GTK_PROGRESS(ds->progress), "%v%%");
  gtk_progress_set_show_text(GTK_PROGRESS(ds->progress), TRUE);
  gtk_box_pack_start(GTK_BOX(vbox), ds->progress, TRUE, TRUE, FALSE);
  gtk_widget_show(ds->progress);  

  ds->text = gtk_label_new("time");
  gtk_box_pack_start(GTK_BOX(vbox), ds->text, 
		     TRUE,
		     TRUE,
		     FALSE);
  gtk_widget_show(ds->text);
  return ;
}

GtkWidget *
CreateVBox(datastruct*ds, GtkWidget * w)
{
  GtkWidget * v = gtk_vbox_new (FALSE, FALSE);  
  gtk_container_add (GTK_CONTAINER (w), v);
  CreateItems(ds, v);
  gtk_widget_show(v);
				/* this v is the vbox people should add their objects to. */
  return v;
}

void
CreateMainWindow(datastruct * ds)
{
  GtkWidget *winMain ;  
  GtkWidget * vbox;
  
  winMain=gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_widget_set_usize (winMain, 512, 256);
  
  gtk_signal_connect (GTK_OBJECT(winMain), "delete_event", 
		      GTK_SIGNAL_FUNC(delete_event), NULL);
  gtk_signal_connect (GTK_OBJECT(winMain), "destroy",
		      GTK_SIGNAL_FUNC(destroy_callback), NULL);  
  vbox=CreateVBox(ds, winMain);
  gtk_widget_show(winMain);
  return ;
}

gint timeout_command (gpointer data)
{
  datastruct * ds = (datastruct * )data;
  char * strbuf=NULL;
  int time_current=time_max-(time(NULL)-start_time);
  
  gtk_progress_configure(GTK_PROGRESS(ds->progress), 
			 (float)time_current / (float)time_max * 100.0, 
			 0.0, 100);
  asprintf (&strbuf, "%i:%.2i", 
	    time_current / 60,
	    time_current % 60);

  gtk_label_set_text (GTK_LABEL(ds->text), strbuf);
  free (strbuf);  
  return 1;  
}

int main (int ac, char**av)
{
  gint hTimeout;
  datastruct ds;

  /* general initialization. */
  setlocale(LC_TIME, "");
  gtk_init (&ac, &av);
  if (ac < 2)
    {
      fprintf(stderr, "Usage:\n\t%s minutes\n\n", 
	      av[0]);
      return 1;
    }
  
  start_time=time(NULL);
  time_max= atoi(av[1])*60;
  CreateMainWindow(&ds);
  hTimeout = gtk_timeout_add(1000, timeout_command, &ds);
  gtk_main();
  gtk_timeout_remove(hTimeout);
  return 0;
}
