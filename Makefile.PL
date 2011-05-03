
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'A simple FTP client library for POE',
  'AUTHOR' => 'Apocalypse <APOCAL@cpan.org>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'ExtUtils::MakeMaker' => '6.31',
    'Test::Deep' => '0',
    'Test::More' => '0.88'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'POE-Component-Client-SimpleFTP',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'POE::Component::Client::SimpleFTP',
  'PREREQ_PM' => {
    'DateTime::Format::Strptime' => '0',
    'Exporter' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'MooseX::POE::SweetArgs' => '0',
    'POE' => '0',
    'POE::Driver::SysRW' => '0',
    'POE::Filter::Line' => '0',
    'POE::Filter::Stream' => '0',
    'POE::Wheel::ReadWrite' => '0',
    'POE::Wheel::SocketFactory' => '0',
    'Socket' => '0',
    'parent' => '0'
  },
  'VERSION' => '0.002',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



