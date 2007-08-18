#!/usr/bin/perl

#$t=1;
#while( $t < 256 ){
#  printf( "\\ja\\char%d",$t );
#  ++$t;
#}
$s=80;
$i=0;
while( $i < 3390 ){
  $t=33;
  while( $t < 127 ){
    printf( "\'\x1b\x24\x42%c%c\x1b\x28\x42\' \'\' %2d\n",$s,$t,$i%256);
    ++$t;
    ++$i;
  }
  ++$s;
}

