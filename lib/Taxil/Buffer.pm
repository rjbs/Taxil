package Taxil::Buffer;
use Moose;

use namespace::autoclean;

use Taxil::Types qw(_HunkArray _PotentialHunkArray);

has hunks => (
  is  => 'ro',
  isa => _HunkArray,
  init_arg => undef,
  lazy     => 1,
  default  => sub {
    my ($self) = @_;
    my $hunks = to__HunkArray($self->_potential_hunks);
    $self->_clear_potential_hunks;
    return $hunks;
  },
);

has _potential_hunks => (
  is  => 'ro',
  isa => _PotentialHunkArray,
  required => 1,
  init_arg => 'hunks',
  clearer  => '_clear_potential_hunks',
);

sub stream_to_stdout {
  my ($self) = @_;

  print STDOUT $$_ for @{ $self->hunks };
}

1;
