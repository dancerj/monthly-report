#!/usr/bin/perl

print '\documentclass{article}\begin{document}';
$t=1;
while( $t < 122 ){
  printf( "\\jroma\\char%d",$t );
  ++$t;
}
print '\end{document}';
