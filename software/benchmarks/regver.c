#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/mman.h>
int main(void){ int fd=open("/dev/mem",O_RDWR|O_SYNC); volatile uint32_t *r=mmap(0,0x1000,PROT_READ|PROT_WRITE,MAP_SHARED,fd,0xA0000000);
  printf("VERSION=0x%08x (mong doi 0x00060001)\n", r[0x40/4]); return 0; }
