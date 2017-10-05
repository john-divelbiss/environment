#!/usr/bin/env perl
use feature qw(say);
use Getopt::Long 'HelpMessage';
use File::Copy;
use Cwd qw(cwd);

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

my %install_packages = (
    "bash"=> true,
    "vim" => true, 
    "git" => true
);

my ( @package );
GetOptions(
    'help'      => sub { HelpMessage(0) },
    'verbose' => \my $verbose,
    'package=s{1,3}' => \@package,
) or HelpMessage(1);

if($#package >= 0) {
    foreach (@package) {
        if(exists $install_packages{$_}) {


            if( lc($_) eq "vim" ) {
                print "\nInstalling package: " . $_ . "\n";
                install_vim();
            } elsif(lc($_) eq "bash") {
                print "\nInstalling package: " . $_ . "\n";
                install_bash();
            } elsif(lc($_) eq "git") {
                print "\nInstalling package: " . $_ . "\n";
                install_git();
            }


        } else {
            print "\n---------ERROR!!-----------\n";
            print "Trying to install unknown package: " . $_;
            print "\n---------------------------\n";
        }
    }
} else {
    print "Installing All Packages:\n";
    
    print "\nInstalling package: VIM\n";
    install_vim();

    print "\nInstalling package: BASH\n";
    install_bash();

    print "\nInstalling package: GIT\n";
    install_git();
}

print "Sourcing .bashrc";
system(". ~/.bashrc");

=item install_bash()

Method used to install scripts/aliases to .bash_profile

=cut

sub install_bash {
    print "\n========================================================\n";

    print "Checking for existing .bash_aliases...\n";
    print "Path:  " . $ENV{"HOME"} . "/.bash_aliases\n";

    if( -e $ENV{"HOME"} . "/.bash_aliases") {
        print "An existing .bash_aliases exists.";

        my $user_input = "";
        while( lc($user_input) ne "n" && lc($user_input) ne "y") {
            print "Overwrite [y/n]?: ";
            chomp($user_input = <STDIN>);
        }

        if( lc($user_input) eq "n" ) {
            print "\nSkipping .bash_aliases install\n";
            return;
        } 
    }


    print  "Copying bash_colors....\n";
    copy(cwd . "/env/bash_colors", $ENV{"HOME"} . "/.config/bash_colors") or die "\n\nFailed to copy /env/bash_colors!!!\n"; 

    print "Copying .bash_aliases...\n";
    copy(cwd . "/env/.bash_aliases", $ENV{"HOME"} . "/.bash_aliases") or die "\n\nFailed to copy /env/.bash_aliases!!!\n"; 
}

sub install_vim {

    print "\n========================================================\n";
    print "\nCopying .vimrc to " . $ENV{"HOME"} . "/.vimrc\n";

    if( -e $ENV{"HOME"} . "/.vimrc" ) {
        print "\nAn existing .vimrc file exists.";
        
        my $user_input = "";
        while( lc($user_input) ne "n" && lc($user_input) ne "y") {
            print "Overwrite [y/n]?: ";
            chomp($user_input = <STDIN>);
        }

        if( lc($user_input) eq "n" ) {
            print "\nSkipping .vimrc install\n";
            return;
        }
    }

    if( -e cwd . "/vim/.vimrc") {
        copy(cwd . "/vim/.vimrc", $ENV{"HOME"} . "/.vimrc") or die "Failed to copy"; 
    } else {
        print "\n-----------ERROR!!!!!!!--------\n";
        print "Unable to find .vimrc at:  ". cwd . "/vim/.vimrc";
        print "\n---------------------------\n";
    }
}

=item install_git()

Method used to install scripts/aliases for git

=cut

sub install_git {

    print "\n========================================================\n";
    print "Initializing GIT settings\n";
    system(cwd . "/git/git_setup.sh");

    print "\nCopying git_aliases to " . $ENV{"HOME"} . "/.config/git_aliases";

    if( -e $ENV{"HOME"} . "/.config/git_aliases" ) {
        print "\nAn existing .config/git_aliases file exists.";
        
        my $user_input = "";
        while( lc($user_input) ne "n" && lc($user_input) ne "y") {
            print "Overwrite [y/n]?: ";
            chomp($user_input = <STDIN>);
        }

        if( lc($user_input) eq "n" ) {
            print "\nSkipping .config/git_aliases install\n";
            return;
        }
    }



    copy(cwd . "/git/git_aliases", $ENV{"HOME"} . "/.config/git_aliases") or die "Failed to copy /git/git_aliases"; 
    copy(cwd . "/git/config", $ENV{"HOME"} . "/.ssh/config") or die "Failed to copy ~/.ssh/config"; 

}


