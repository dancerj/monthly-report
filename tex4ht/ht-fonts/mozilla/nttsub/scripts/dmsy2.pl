#!/usr/bin/perl

#$t=1;
#while( $t < 256 ){
#  printf( "\\ja\\char%d",$t );
#  ++$t;
#}
$i=1;
  $t=33;
  while( $t < 133 ){
    printf( "\'\x1b\x24\x42\x21%c\x1b\x28\x42\' \'\' %2d\n",$t,$i);
    ++$t;
    ++$i;
  }
  $t=33;
  while( $t < 127 ){
    printf( "\'\x1b\x24\x42\x22%c\x1b\x28\x42\' \'\' %2d\n",$t,$i);
    ++$t;
    ++$i;
  }
