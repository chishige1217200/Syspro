#ifndef __SPIM_H__
#define __SPIM_H__

#include <stdio.h>
#include <stdlib.h>

#define print_int(i)         printf("%d", (i))
#define print_string(s)      printf("%s", (s))

int read_int(void)
{
  char buf[1024];
  int  n;

  if (fgets(buf, sizeof(buf), stdin) == NULL)
    return 0;
  sscanf(buf, "%d", &n);
  return n;
}

void read_string(char *buf, int n)
{
  (void) fgets(buf, n, stdin);
}

#endif /*__SPIM_H__*/