SELECT ITEM_BARCODE.ITEM_BARCODE AS hyllypaikka, PATRON.FIRST_NAME, PATRON.LAST_NAME, PATRON_ADDRESS.ADDRESS_LINE1, PATRON_ADDRESS.ADDRESS_TYPE, CIRC_TRANSACTIONS.CURRENT_DUE_DATE INTO apu_säilytyspaikka_email
FROM (((BIB_MFHD INNER JOIN MFHD_ITEM ON BIB_MFHD.MFHD_ID = MFHD_ITEM.MFHD_ID) INNER JOIN ITEM_BARCODE ON MFHD_ITEM.ITEM_ID = ITEM_BARCODE.ITEM_ID) INNER JOIN (CIRC_TRANSACTIONS INNER JOIN PATRON ON CIRC_TRANSACTIONS.PATRON_ID = PATRON.PATRON_ID) ON MFHD_ITEM.ITEM_ID = CIRC_TRANSACTIONS.ITEM_ID) INNER JOIN PATRON_ADDRESS ON PATRON.PATRON_ID = PATRON_ADDRESS.PATRON_ID
WHERE (((BIB_MFHD.BIB_ID)="1193864" Or (BIB_MFHD.BIB_ID)="1195852" Or (BIB_MFHD.BIB_ID)="1195851"))
GROUP BY ITEM_BARCODE.ITEM_BARCODE, PATRON.FIRST_NAME, PATRON.LAST_NAME, PATRON_ADDRESS.ADDRESS_LINE1, PATRON_ADDRESS.ADDRESS_TYPE, CIRC_TRANSACTIONS.CURRENT_DUE_DATE
HAVING (((PATRON_ADDRESS.ADDRESS_TYPE)="3") AND ((CIRC_TRANSACTIONS.CURRENT_DUE_DATE) Between #1/1/2017# And #1/1/2018#))
ORDER BY ITEM_BARCODE.ITEM_BARCODE;

