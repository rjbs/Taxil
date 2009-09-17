#!perl
use strict;
use warnings;

use Test::More 'no_plan';

use Taxil::Types qw(_HunkArray _Hunk);

{
  my @hunks = (
    \'This is a hunk.',
    # 'This is a hunk.',
    sub { \'This is a hunk.' },
    # sub { 'This is a hunk.' },
  );
  
  for my $hunk (@hunks) {
    is_deeply(
      to__Hunk($hunk),
      \'This is a hunk.',
      "we can coerce to hunk",
    );
  }
}

my $potential_hunk_array = [
  "Now is the winter",
  [
    \" of ",
    [ \("our ", "discontent") ],
    sub { " made glorious summer" },
  ],
  sub { \" by this son of York." },
];

Taxil::Types::_PotentialHunkArray->assert_valid($potential_hunk_array);

my $hunk_array = to__HunkArray($potential_hunk_array);

ok($hunk_array, "we could get something from potential hunk array")
  or BAIL_OUT "no point in continuing, hunk array coersion is shot";

is_deeply(
  to__HunkArray($potential_hunk_array),
  [
    \(
      "Now is the winter",
      " of ",
      "our ",
      "discontent",
      " made glorious summer",
      " by this son of York.",
    ),
  ],
  "we can coerce to a HunkArray",
);

