package Mojo::UserAgent::Google;
use strict;
use warnings;

use Mojo::Base 'Mojo::UserAgent';

has 'token';

sub build_tx {
    my $self = shift;
    if ($self->token) {
	my $tx = $self->SUPER::build_tx(@_);
	$tx->req->headers->authorization('Bearer ' . $self->token->{access_token});
	return $tx;
    } else {
	return $self->SUPER::build_tx(@_);
    }
}


1
