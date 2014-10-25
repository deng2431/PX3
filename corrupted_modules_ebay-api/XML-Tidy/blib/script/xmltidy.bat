@rem = '--*-Perl-*--
@echo off
if "%OS%" == "Windows_NT" goto WinNT
perl -x -S "%0" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto endofperl
:WinNT
perl -x -S %0 %*
if NOT "%COMSPEC%" == "%SystemRoot%\system32\cmd.exe" goto endofperl
if %errorlevel% == 9009 echo You do not have Perl in your PATH.
if errorlevel 1 goto script_failed_so_exit_with_non_zero_val 2>nul
goto endofperl
@rem ';
#!/usr/bin/perl -w
#line 15
# 4BJ9OVI - xmltidy created by Pip Stuart <Pip@CPAN.Org>
#   to tidy up all the element indenting of XML documents.
# The parameters are:
#   filename
#   indent_string  ('tab' works as an alternate way to specify "\t")
# Examples:
#   `xmltidy FileName.xml ' '`     # one  (1) space  per indent level
#   `xmltidy FileName.xml '    '`  # four (4) spaces per indent level
#   `xmltidy FileName.xml tab`     # one  (1) tab    per indent level
# This utility is part of the XML::Tidy Perl Module.  Please run
#   `perldoc XML::Tidy` from the command-line for further documentation.
# This is licensed under the GNU General Public License version 2.
use strict; use XML::Tidy;
my $flnm = shift() || die "USAGE: `$0 FileName.xml '<indent_string>'`\n";
my $tidy = XML::Tidy->new($flnm); $tidy->tidy(shift()); $tidy->write();

__END__
:endofperl
