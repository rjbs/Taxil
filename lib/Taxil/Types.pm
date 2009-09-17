package Taxil::Types;

use MooseX::Types -declare => [ qw(
  _Hunk _HunkArray
  _PotentialHunk _PotentialHunkArray
) ];

use MooseX::Types::Moose qw(Str ScalarRef ArrayRef CodeRef);;

subtype _Hunk, as ScalarRef;
subtype _HunkArray, as ArrayRef[ _Hunk ];

coerce _Hunk, from Str, via { \$_ };
coerce _Hunk, from _HunkArray, via { join q{}, map {; $$_ } @$_ };

subtype _PotentialHunk, as (Str | ScalarRef | CodeRef);
subtype _PotentialHunkArray,
  as ArrayRef[ _PotentialHunk | _PotentialHunkArray ];

coerce _Hunk,
  from _PotentialHunk,
  via {
    return $_ unless is_CodeRef($_);
    my $rv = $_->();
    return ref $rv ? $rv : \$rv
  };

coerce _HunkArray,
  from _PotentialHunkArray,
  via { [
    map {; is_ArrayRef($_) ? @{ _HunkArray->coerce($_) } : _Hunk->coerce($_) } @$_
  ] };

1;
