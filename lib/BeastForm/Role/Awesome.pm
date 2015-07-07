package BeastForm::Role::Awesome;

use Moo::Role;
use BeastForm::Schema;

with 'DBIx::BeastForm::Role::Introspective';

has aweschema => (is => 'lazy');

sub table {

}

sub _build_aweschema {
  my ($self) = @_;
  BeastForm::Awesome::Schema->from_sqlt_schema($self->schema);
}

sub dynamic {
  my ($self) = @_;
  $self->aweschema->dynamic;
}

sub static {
  die("static is not currently implemented. Patches welcome!");
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

BeastForm::Role::Awesome

=head1 VERSION

version 0.000000

=head1 AUTHOR

James Laver <james.laver@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by James Laver on time generously donated by Anomalio.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
