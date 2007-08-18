#!/usr/bin/perl

#$t=1;
#while( $t < 256 ){
#  printf( "\\ja\\char%d",$t );
#  ++$t;
#}
$i=1;
  $t=33;
  while( $t < 33+94 ){
    printf( "\'\x1b\x24\x42\x21%c\x1b\x28\x42\' \'\' %2d\n",$t,$i);
    ++$t;
    ++$i;
  }

  $t=33;
  while( $t < 33+14 ){
    printf( "\'\x1b\x24\x42\x22%c\x1b\x28\x42\' \'\' %2d\n",$t,$i);
    ++$t;
    ++$i;
  }

  $t=58;
  while( $t < 58+8 ){
    printf( "\'\x1b\x24\x42\x22%c\x1b\x28\x42\' \'\' %2d\n",$t,$i);
    ++$t;
    ++$i;
  }

  $t=74;
  while( $t < 74+7 ){
    printf( "\'\x1b\x24\x42\x22%c\x1b\x28\x42\' \'\' %2d\n",$t,$i);
    ++$t;
    ++$i;
  }

  $t=114;
  while( $t < 114+8 ){
    printf( "\'\x1b\x24\x42\x22%c\x1b\x28\x42\' \'\' %2d\n",$t,$i);
    ++$t;
    ++$i;
  }

  $t=126;
    printf( "\'\x1b\x24\x42\x22%c\x1b\x28\x42\' \'\' %2d\n",$t,$i);
