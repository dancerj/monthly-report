/*BINFMTC: 
 * experiment with flock.
 *
 * Multiple instance of this code will wait for another instance.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/file.h>
#include <sys/fcntl.h>

int main(int argc, char** argv)
{
  if(argc==2) 
    {
      int fd=open(argv[1], O_RDONLY);
      if (-1==fd) 
	{
	  perror("open");
	  /* this will usually not fail unless there is something
	     wrong with the file */
	  return 1;
	}
      
      if (-1==flock(fd, LOCK_EX)) 
	{
	  perror("flock");
	  /* This will usually not fail. It will wait. */
	  return 1;
	}
      
      printf("Locked file, sleeping...");
      fflush(stdout);
      sleep(10);
      printf("done\n");
      if (-1==flock(fd, LOCK_UN)) 
	{
	  /* This does not usually fail */
	  perror("flock");
	  return 1;
	}
      printf("Unlocked file.\n");

      close(fd);
    }
  else
    {
      fprintf(stderr, "Usage: \n\t%s [file to lock]\n", 
	      argv[0]);
      return 1;
    }
  return 0;
}
