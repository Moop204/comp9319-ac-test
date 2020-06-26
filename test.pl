#!/usr/bin/perl

my $text="./rsc/bms.txt";
my $encode="./aencode";
my $decode="./adecode";
my $cfile="correct.txt";
my $ofile="output.txt";

open(my $FILE, '<', $text) or die "Could not open $text";

open(my $CF, '>', "$cfile");
open(my $OF, '>', "$ofile");

foreach my $line (<$FILE>) {
  #chomp($line); 
  $line =~ s/\s*$//g;
  $line =~ s/"/\\"/g;
  if($line ne "") {
    #print "$line\n";
    print $CF "$line\n";
    my $res=`echo "$line" | $encode | $decode`; 
    print $OF "$res";
  }
}

close $FILE;
close $CF;
close $OF;

exec("diff $cfile $ofile")
