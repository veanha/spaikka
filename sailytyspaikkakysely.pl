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

my $message = "Hyvä säilytyspaikan käyttäjä \n\n
Ole hyvä ja vastaa tähän viestiin sähköpostitse: tarvitsetko edelleen säilytyspaikkaa vapaakappalekokoelman (fennica) aineistolle vai voiko paikan poistaa käytöstäsi?\n
Lähetä vastauksesi viimeistään 10.9.2017.\n
Ellet vastaa kyselyyn säilytyspaikka poistetaan.\n\n
Nimi: ".$nimi."     Säilytyspaikan nro: ".$paikka." \n\n
Huomioithan, että luvattoman aineiston säilyttämisestä säilytyspaikassa seuraa 10 euron maksu.\n
Kiitos vastauksestasi!\n
Lisätietoja: \n
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
