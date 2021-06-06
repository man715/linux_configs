/* 
 * propecia.c 
 * 2-20-99  
 * 
 * A fast class C domain scanner that scans for a specified open port.
 * 
 * Usage: ./propecia [X.X.X] <port>
 * 
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <sys/signal.h>
#include <sys/socket.h>
#include <netinet/in.h>

#define DEFAULT_PORT 23

int main (int argc, char *argv[])
{

  int sockfd, result, counter = 0;
  char host[15];
  char *ip;
  int port;

  struct sockaddr_in address;

  if (argc < 2)
    {
      printf ("Usage: %s [X.X.X] <port>\n", argv[0]);
      exit (1);
    }

  if(argv[2] != NULL)   
    port = atoi(argv[2]);
  else
    port = DEFAULT_PORT;

ip = argv[1];
sprintf(host, "%s.255", ip);
   if(!inet_aton(host, &address.sin_addr))
     { printf("error: invalid class c\n"); exit(1); }

  while (counter < 255)
    {

      ++counter;

      sprintf (host, "%s.%d\n", ip, counter);

      if ((fork ()) == 0)
	{

	  address.sin_family = AF_INET;
	  address.sin_port = htons (port);
	  address.sin_addr.s_addr = inet_addr (host);

	  sockfd = socket (AF_INET, SOCK_STREAM, 0);

	  if (sockfd < 0)
	    {
	      perror ("Socket");
	      exit (2);
	    }

	  alarm (3);

	  result = connect (sockfd, (struct sockaddr *) &address, sizeof (address));

	  if (result == 0)
	    {
	      printf ("%s", host);
	      close (sockfd);
	      exit (0);
	      continue;
	    }
	  exit (0);
	}

    }
  
  sleep(1);
  close (sockfd);
  exit (0);

}
