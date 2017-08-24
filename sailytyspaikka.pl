#!/usr/bin/perl -w
use strict;
my $nimi;
my $paikka;
my $email;
my $from = 'kirjasto-lukusali@jyu.fi';
my $subject = 'Säilytyspaikkakysely';

while (<>) {
($nimi, $paikka, $email) = /^"(.*)";(.*);"(.*)"/;

my $message = "Hyvä säilytyspaikan käyttäjä \n\n
Säilytyspaikkakysely suoritetaan sähköpostikyselynä 9.- 22.5.2011.\n\n
Ole hyvä ja vastaa sähköpostitse: tarvitsetko edelleen säilytyspaikkaa
vapaakappalekokoelman (fennica) aineistolle vai voiko paikan poistaa
käytöstäsi?\n
Lähetä vastauksesi viimeistään 22.5.2011.\n\n
Nimi: ".$nimi."     Säilytyspaikan nro: ".$paikka." \n\n
Luvattoman aineiston säilyttämisestä säilytyspaikassa seuraa lainakielto
maksuineen. \n\n
Kiitos vastauksestasi!\n\n
Huomioithan, että vastausten suuresta määrästä johtuen, viestisi käsitellään myöhemmin ja sinuun otetaan tarvittaessa
yhteyttä.\n\n
Lisätietoja: \n
kirjasto-lukusali\@jyu.fi\n
http://kirjasto.jyu.fi \n
Lukusalipalvelut ja tietopalvelun päivystys, puh. (014) 260 3432\n";

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


