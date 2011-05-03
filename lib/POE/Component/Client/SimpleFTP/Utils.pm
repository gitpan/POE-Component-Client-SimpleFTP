#
# This file is part of POE-Component-Client-SimpleFTP
#
# This software is copyright (c) 2011 by Apocalypse.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
use strict; use warnings;
package POE::Component::Client::SimpleFTP::Utils;
BEGIN {
  $POE::Component::Client::SimpleFTP::Utils::VERSION = '0.001';
}
BEGIN {
  $POE::Component::Client::SimpleFTP::Utils::AUTHORITY = 'cpan:APOCAL';
}

# ABSTRACT: Miscellaneous FTP utility functions

use parent 'Exporter';
our @EXPORT_OK = qw(
	code_preliminary code_success code_intermediate code_failure code_tls
	EOL
);
our %EXPORT_TAGS = (
	'code' => [
		qw( code_preliminary code_success code_intermediate code_failure code_tls ),
	],
);






# helper subs to figure out what a code is
sub code_preliminary { return substr( $_[0], 0, 1 ) == 1 }
sub code_success { return substr( $_[0], 0, 1 ) == 2 }
sub code_intermediate { return substr( $_[0], 0, 1 ) == 3 }
sub code_failure { return $_[0] =~ /^[45]/ }
sub code_tls { return substr( $_[0], 0, 1 ) == 6 }


sub EOL () { "\015\012" }

1;


__END__
=pod

=for :stopwords Apocalypse

=encoding utf-8

=head1 NAME

POE::Component::Client::SimpleFTP::Utils - Miscellaneous FTP utility functions

=head1 VERSION

  This document describes v0.001 of POE::Component::Client::SimpleFTP::Utils - released May 02, 2011 as part of POE-Component-Client-SimpleFTP.

=head1 SYNOPSIS

	use POE::Component::Client::SimpleFTP::Utils qw( :code );

	# in an event handler
	my $code = shift;
	if ( code_success( $code ) ) {
		print "FTP command OK\n";
	} else {
		warn "FTP command error!";
	}

=head1 DESCRIPTION

This module provides the various utility functions for use in your FTP application. You can import any sub listed in the POD or those tags:

=head2 code

Imports all of the code_* subs

=head1 FUNCTIONS

=head2 code_preliminary

Tests whether the code is a 1yz code ( Positive Preliminary reply ) and returns a boolean value.

=head2 code_success

Tests whether the code is a 2yz code ( Positive Completion reply ) and returns a boolean value.

=head2 code_intermediate

Tests whether the code is a 3yz code ( Positive Intermediate reply ) and returns a boolean value.

=head2 code_failure

Tests whether the code is a 4yz or 5yz code ( Transient/Permanent Negative Completion reply ) and returns a boolean value.

=head2 code_tls

Tests whether the code is a 6yz code ( Protected reply ) and returns a boolean value.

=head2 EOL

Returns the end-of-line terminator as specified in RFC 959

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<POE::Component::Client::SimpleFTP|POE::Component::Client::SimpleFTP>

=back

=head1 AUTHOR

Apocalypse <APOCAL@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Apocalypse.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

The full text of the license can be found in the LICENSE file included with this distribution.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT
WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER
PARTIES PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
SOFTWARE IS WITH YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME
THE COST OF ALL NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE LIABLE
TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
DAMAGES.

=cut

