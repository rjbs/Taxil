#!perl
use strict;
use warnings;

use Taxil::Buffer;

my $buffer = Taxil::Buffer->new({
  hunks => [
    "This is going to be great.\n",
    \"We're gonna have...\n\n",
    [
      \"THE FOLLOWING:\n",
      map {; " * $_\n" } qw(chicken waffles beer),
    ],
    [ [ [ "\n -- the end --\n" ] ] ],
  ],
});

$buffer->stream_to_stdout;
