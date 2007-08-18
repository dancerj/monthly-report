#!/usr/bin/perl

#$t=1;
#while( $t < 256 ){
#  printf( "\\ja\\char%d",$t );
#  ++$t;
#}
$i=1;
  $t=33;
  while( $t < 123 ){
    printf( "\'\x1b\x24\x42\x23%c\x1b\x28\x42\' \'\' %2d\n",$t,$t);
    ++$t;
    ++$i;
  }
