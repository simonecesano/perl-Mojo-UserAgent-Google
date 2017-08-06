package Mojo::UserAgent::Google;

# ABSTRACT: a Mojo::UserAgent that passes the Google authorization token in the request header

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
