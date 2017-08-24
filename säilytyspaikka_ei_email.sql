SELECT apu_säilytyspaikka.hyllypaikka, apu_säilytyspaikka.FIRST_NAME, apu_säilytyspaikka.LAST_NAME, apu_säilytyspaikka.CURRENT_DUE_DATE
FROM apu_säilytyspaikka LEFT JOIN apu_säilytyspaikka_email ON apu_säilytyspaikka.hyllypaikka = apu_säilytyspaikka_email.hyllypaikka
WHERE (((apu_säilytyspaikka_email.ADDRESS_LINE1) Is Null));


