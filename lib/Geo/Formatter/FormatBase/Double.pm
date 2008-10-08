package Geo::Formatter::FormatBase::Double;

use warnings;
use strict;
use Carp;

use version; our $VERSION = qv('0.0.1');
use base qw(Geo::Formatter::FormatBase);

sub enc_wrap {
    my $pkg    = shift;

    return $pkg->can("encode") ? sub {
        if (@_ < 2) {
            croak "Latitude and Longitude are neccesary";
        } elsif (@_ > 3) {
            croak "Too many arguments";
        } elsif (@_ == 3 && ref($_[2]) ne "HASH") {
            croak "Option value must be hash reference";
        }

        my @ret = $pkg->encode(@_);

        wantarray ? @ret : \@ret;
    } : undef;
}

sub dec_wrap {
    my $pkg    = shift;

    return $pkg->can("decode") ? sub {
        if (@_ < 2) {
            croak "Latitude and Longitude are neccesary";
        } elsif (@_ > 3) {
            croak "Too many arguments";
        } elsif (@_ == 3 && ref($_[2]) ne "HASH") {
            croak "Option value must be hash reference";
        }

        my @ret = $pkg->decode(@_);

        wantarray ? @ret : \@ret;
    } : undef;
}

1;

__END__

=head1 NAME

Geo::Formatter::FormatBase::Double - Base class of Geo::Formatter's multiple value format class


=head1 DESCRIPTION

This module is base class of Geo::Formatter's multiple value format class.
If you want to single value format, inherit this module and write methods named
decode and encode.


=head1 METHOD

=over

=item * enc_wrap

=item * dec_wrap

=back


=head1 AUTHOR

OHTSUKA Ko-hei  C<< <nene@kokogiko.net> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, OHTSUKA Ko-hei C<< <nene@kokogiko.net> >>.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

