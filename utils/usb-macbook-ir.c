/*BINFMTC:  -lusb -L /usr/X11R6/lib -lXt -lXtst

USB Macbook IR controller tools.

references:
http://www.madingley.org/macmini/kernel/ir.patch
http://www.gniibe.org/software/hub-ctrl.c

 */

#include <stdio.h>
#include <stdlib.h>
#include <usb.h>
#include <errno.h>
#include <sched.h>
#include <X11/Xlib.h>
#include <X11/extensions/XTest.h>

#define USB_VENDOR_ID_APPLE	0x05ac
#define USB_DEVICE_ID_APPLE_IR  0x8240
#define USB_ENDPOINT  0x83

/* 
MacBook

key pressed: 25 87 ee 44 2  menu
key pressed: 25 87 ee 44 4  >||
key pressed: 25 87 ee 44 7  >>
key pressed: 25 87 ee 44 8  <<
key pressed: 25 87 ee 44 b  +
key pressed: 25 87 ee 44 d  -
key pressed: 26 0 0 0 0  repeat
key pressed: 25 87 e0 44 6  ???

4th byte looks random.

 */

int keymap[8]={
  0,				/* reserved */
  97,				/* home */
  105, 				/* next */
  105,				/* pgdn */
  99, 				/* pgup */
  99,				/* pgup */
  105				/* pgdn */
};

void process_device(usb_dev_handle* uh)
{
  const int timeout=1000;	/* msec */
  const int size=32;
  char buf[size+1];
  int n;
  Display *display=XOpenDisplay(NULL);

  if(!display)
    {
      fprintf(stderr, "Cannot open display\n");
      return;
    }

  usb_detach_kernel_driver_np(uh,0);
  
  printf("claim: %p, %i\n", uh, (usb_claim_interface(uh,0)));
  
  while (1)
    {
      if((n=usb_interrupt_read(uh, USB_ENDPOINT, buf, size, timeout))>0)
	{
	  int i;	
	  printf("key pressed: ");
	  for (i=0; i<n; ++i)
	    printf("%x ", (int)(unsigned char)buf[i]);
	  printf("\n");
	  if ((buf[0]==(char)0x25)&&
	      (buf[1]==(char)0x87)&&
	      (buf[2]==(char)0xee))
	    //(buf[3]==44) 4th byte is probably random.
	    {
	      printf("ack: \n");
	      XTestFakeKeyEvent(display, 
				keymap[buf[4]%16 >> 1],
				1,
				0);
	      XSync(display, 0);
	      sched_yield();
	      
	      XTestFakeKeyEvent(display, 
				keymap[buf[4]%16 >> 1],
				0,
				0);
	      XSync(display, 0);
	      sched_yield();
	    }
	}
      //printf("n=%i\n", n);
    }
  usb_close(uh);
}

int
main(int ac, char** av)
{
  struct usb_bus* bus;
  struct usb_device* dev;
  
  usb_init ();
  usb_find_busses ();
  usb_find_devices ();

  for(bus=usb_get_busses(); bus; bus=bus->next)
    {
      for(dev=bus->devices; dev; dev=dev->next)
	{
	  if((dev->descriptor.idVendor == USB_VENDOR_ID_APPLE) &&
	     (dev->descriptor.idProduct == USB_DEVICE_ID_APPLE_IR))
	    {
	      printf("bus %s, dev %i\n",
		     bus->dirname, 
		     dev->devnum);
	      process_device(usb_open(dev));
	      return 0;
	    }
	  
	}
    }
  fprintf (stderr, "Cound not find device %x:%x\n", 
	  USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_IR);
  return 1;
}

