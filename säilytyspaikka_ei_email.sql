SELECT apu_s�ilytyspaikka.hyllypaikka, apu_s�ilytyspaikka.FIRST_NAME, apu_s�ilytyspaikka.LAST_NAME, apu_s�ilytyspaikka.CURRENT_DUE_DATE
FROM apu_s�ilytyspaikka LEFT JOIN apu_s�ilytyspaikka_email ON apu_s�ilytyspaikka.hyllypaikka = apu_s�ilytyspaikka_email.hyllypaikka
WHERE (((apu_s�ilytyspaikka_email.ADDRESS_LINE1) Is Null));


