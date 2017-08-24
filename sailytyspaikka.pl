#!/usr/bin/perl -w
use strict;
my $nimi;
my $paikka;
my $email;
my $from = 'kirjasto-lukusali@jyu.fi';
my $subject = 'S�ilytyspaikkakysely';

while (<>) {
($nimi, $paikka, $email) = /^"(.*)";(.*);"(.*)"/;

my $message = "Hyv� s�ilytyspaikan k�ytt�j� \n\n
S�ilytyspaikkakysely suoritetaan s�hk�postikyselyn� 9.- 22.5.2011.\n\n
Ole hyv� ja vastaa s�hk�postitse: tarvitsetko edelleen s�ilytyspaikkaa
vapaakappalekokoelman (fennica) aineistolle vai voiko paikan poistaa
k�yt�st�si?\n
L�het� vastauksesi viimeist��n 22.5.2011.\n\n
Nimi: ".$nimi."     S�ilytyspaikan nro: ".$paikka." \n\n
Luvattoman aineiston s�ilytt�misest� s�ilytyspaikassa seuraa lainakielto
maksuineen. \n\n
Kiitos vastauksestasi!\n\n
Huomioithan, ett� vastausten suuresta m��r�st� johtuen, viestisi k�sitell��n my�hemmin ja sinuun otetaan tarvittaessa
yhteytt�.\n\n
Lis�tietoja: \n
kirjasto-lukusali\@jyu.fi\n
http://kirjasto.jyu.fi \n
Lukusalipalvelut ja tietopalvelun p�ivystys, puh. (014) 260 3432\n";

sendEmail($email, $from, $subject, $message);
sleep(1);
}

sub sendEmail
 {
        my ($to, $from, $subject, $message) = @_;
        my $sendmail = '/usr/lib/sendmail';
        open(MAIL, "|$sendmail -oi -t");
                print MAIL "From: $from\n";
                print MAIL "To: $to\n";
                print MAIL "Subject: $subject\n\n";
                print MAIL "$message\n";
        close(MAIL);
 }


