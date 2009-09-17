package Taxil::Component;
use Moose::Role;

use namespace::autoclean;

=begin comment

  I think this is what I'll need to do.
  if you do Taxil::Component, you must do Path::Resolver
  so say I've registered /foo/bar to $comp
  when I render /foo/bar/baz it means "find $comp, then subdispatch to /baz"
  when I render /foo/bar it means "find $comp, then dispatch to /"
  also makes it really easy to add renderables.
  renderable '/' => sub { ... }

=end comment

=cut

1;
