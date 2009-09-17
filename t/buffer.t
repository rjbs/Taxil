#!perl
use strict;
use warnings;

use Test::More 'no_plan';

use Taxil::Buffer;

my $buffer = Taxil::Buffer->new({
  hunks => [
    "This is going to be great.\n",
    \"We're gonna have...\n\n",
    [
      \"THE FOLLOWING:\n",
      map {; " * $_\n" } qw(chicken waffles beer),
    ],
  ],
});

$buffer->push_hunk( [ [ [ "\n -- the end --\n" ] ] ] );

diag $buffer->dump;

$buffer->hunks;

diag $buffer->dump;

$buffer->push_hunk( [ [ [ "\n -- the real end --\n" ] ] ] );

$buffer->stream_to_stdout;
