#!/usr/bin/perl

$t=33;
while( $t < 33+86 ){
  printf( "\'\x1b\x24\x42%%%c\x1b\x28\x42\' \'\' %2d\n", $t,$t-32 );
  ++$t;
}
