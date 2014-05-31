package Taxil::Role::Resolver;
use Moose::Role;

use Moose::Util::TypeConstraints;
use namespace::autoclean;

with 'Path::Resolver::Role::Resolver';

sub entity_at {
  my ($self, $path) = @_;
}

sub native_type {
  role_type('Taxil::Role::Component');
}

1;
