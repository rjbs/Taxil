package Taxil::Hub;
use Moose;

has resolver => (
  does => 'Taxil::Role::Resolver',
  required => 1,
);

sub render {
  my ($self, $path, $arg) = @_;

  my $component = $self->resolver->resolve( $path );
  $component->render($arg);
}

1;
