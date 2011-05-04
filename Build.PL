
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Test::Deep' => '0',
    'Test::More' => '0.88'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'A simple FTP client library for POE',
  'dist_author' => [
    'Apocalypse <APOCAL@cpan.org>'
  ],
  'dist_name' => 'POE-Component-Client-SimpleFTP',
  'dist_version' => '0.003',
  'license' => 'perl',
  'module_name' => 'POE::Component::Client::SimpleFTP',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
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
    'parent' => '0',
    'perl' => '5.006'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
