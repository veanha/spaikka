#!/usr/bin/perl -w
use strict;
my $nimi;
my $paikka;
my $to;
my $from = 'kirjasto-lukusali@jyu.fi';
my $replyto = 'kirjasto-lukusali@jyu.fi';
my $subject = 'Säilytyspaikkakysely';

while (<>) {
#($nimi, $paikka, $email) = /^"(.*)";"(.*)";"(.*)"/;
($nimi, $paikka, $to) = /^(.*);(.*);(.*)/;

my $message = "Hyvä säilytyspaikan käyttäjä \n
Ole hyvä ja vastaa tähän viestiin sähköpostitse: tarvitsetko edelleen säilytyspaikkaa vapaakappalekokoelman (fennica) aineistolle vai voiko paikan poistaa käytöstäsi?
Lähetä vastauksesi viimeistään 10.9.2018.\n
Ellet vastaa kyselyyn säilytyspaikka poistetaan.\n
Nimi: ".$nimi."     Säilytyspaikan nro: ".$paikka." \n
Jos tarvitset edelleen säilytyspaikkaa, saat sen käyttöösi 28.2.2019 saakka. Kirjaston tulevasta peruskorjauksesta johtuen säilytyspaikat poistetaan käytöstä 1.3.2019 alkaen.
Väistötiloista on mahdollista saada uusi säilytyspaikka. Uusien säilytyspaikkojen käytöstä tulee tarkempaa tietoa myöhemmin.\n
Kiitos vastauksestasi!\n
Lisätietoja:
kirjasto-lukusali\@jyu.fi
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
