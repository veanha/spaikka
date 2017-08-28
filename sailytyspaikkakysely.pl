#!/usr/bin/perl -w
use strict;
my $nimi;
my $paikka;
my $to;
my $from = 'kirjasto-lukusali@jyu.fi';
my $replyto = 'kirjasto-lukusali@jyu.fi';
my $subject = 'S�ilytyspaikkakysely';

while (<>) {
#($nimi, $paikka, $email) = /^"(.*)";"(.*)";"(.*)"/;
($nimi, $paikka, $to) = /^(.*);(.*);(.*)/;

my $message = "Hyv� s�ilytyspaikan k�ytt�j� \n\n
Ole hyv� ja vastaa t�h�n viestiin s�hk�postitse: tarvitsetko edelleen s�ilytyspaikkaa vapaakappalekokoelman (fennica) aineistolle vai voiko paikan poistaa k�yt�st�si?\n
L�het� vastauksesi viimeist��n 10.9.2017.\n
Ellet vastaa kyselyyn s�ilytyspaikka poistetaan.\n\n
Nimi: ".$nimi."     S�ilytyspaikan nro: ".$paikka." \n\n
Huomioithan, ett� luvattoman aineiston s�ilytt�misest� s�ilytyspaikassa seuraa 10 euron maksu.\n
Kiitos vastauksestasi!\n
Lis�tietoja: \n
kirjasto-lukusali\@jyu.fi\n
Tietopalvelu puh. 040 024 7463
Varpu Paananen puh. 040 805 3814
Leena Pappila puh. 040 805 3790\n";

sendEmail($to, $from, $replyto, $subject, $message);
sleep(1);
}

sub sendEmail
 {
        my ($to, $from,$replyto, $subject, $message) = @_;
        my $sendmail = '/usr/lib/sendmail';
        open(MAIL, "|$sendmail -oi -t");
                print MAIL "From: $from\n";
                print MAIL "Reply-to: $replyto\n";
                print MAIL "To: $to\n";
                print MAIL "Subject: $subject\n\n";
                print MAIL "$message\n";
        close(MAIL);
 }
