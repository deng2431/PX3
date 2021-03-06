#!/usr/bin/perl
use Module::Build;
my $mbld = Module::Build->new(
# 'module_name'                   => 'XML::Tidy',
  'dist_name'                     => 'XML-Tidy',
# 'dist_version_from'             => 'Tidy.pm',
  'dist_version'                  => '1.12.B55J2qn',
  'dist_abstract'                 => 'tidy indenting of XML documents',
  'dist_author'                   => 'Pip Stuart <Pip@CPAN.Org>',
# 'create_readme'                 => '1',
# 'create_makefile_pl'            => '1', # 'traditional',
  'license'                       => 'gpl',
  'script_files'                  => {
    'bin/xmltidy'                   => '1',
  },
  'pm_files'                      => {
    'Tidy.pm'                       => 'lib/XML/Tidy.pm',
  },
  'requires'                      => {
    'Math::BaseCnv'                 => '0',
    'Test'                          => '0',
    'Test::Pod'                     => '0',
    'Test::Pod::Coverage'           => '0',
    'XML::XPath'                    => '0',
    'XML::XPath::XMLParser'         => '0',
  },
);
$mbld->create_build_script();