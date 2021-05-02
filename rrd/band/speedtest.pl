#!/usr/bin/perl

my $speedtestPath = "/home/simon/scr/speedtest-cli";
my $speedtestReturn = "";

$speedtestReturn = `$speedtestPath/speedtest-cli`;

$re = '.*?[+-]?\d*\.\d+(?![-+0-9\.]).*?[+-]?\d*\.\d+(?![-+0-9\.]).*?[+-]?\d*\.\d+(?![-+0-9\.]).*?([+-]?\d*\.\d+)(?![-+0-9\.]).*?([+-]?\d*\.\d+)(?![-+0-9\.])';

if ($speedtestReturn =~ m/$re/is)
{
    my $speedtestDn=$1;
    my $speedtestUp=$2;
    print "$1:$2"
}

