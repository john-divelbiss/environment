#!/usr/bin/env perl
use Getopt::Long 'HelpMessage';

#=================================================================
#   HELP MENU

=head1 NAME

install.pl - installs environment scripts to PC

=head1 SYNOPSIS

  --help, -h        Displays Help Menu (this)
  --verbose, -v     Displays debug information
  --package, -p     Packages to install (will install all if not provided)

=head1 VERSION

1.0

=cut
# END HELP MENU
#=================================================================

GetOptions(
    'help'      => sub { HelpMessage(0) },
    'verbose' => \my $verbose,
    'package' => \(my $package = 'all'),
) or HelpMessage(1);

