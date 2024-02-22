INSERT INTO sede VALUES(1,"Pistunina", "SL");
INSERT INTO sede VALUES(2,"Messina Centro", "SL");
INSERT INTO sede VALUES(3, "Palermo", "SR");
INSERT INTO sede VALUES(4, "Termini Imerese", "SL");
INSERT INTO sede VALUES(5, "Rometta Marea", "SL");
INSERT INTO sede VALUES(6, "Corleone", "SL");
INSERT INTO sede VALUES(7, "Cologno Monzese", "SL");
INSERT INTO sede VALUES(8, "Milano", "SR");

INSERT INTO cliente VALUES(1, "Antonio", "Caristia", "a.caristia@gmail.com", "Via dei Gelsomini 11 Rometta Marea", 98040);
INSERT INTO cliente VALUES(2, "Baciamo", "Lemani", "b.lemani@gmail.com", "Via dei martiri di Bronte, Corleone", 90034);
INSERT INTO cliente VALUES(3, "Licio", "Gelli", "l.gelli@gmail.com", "Via P2, Cologno Monzese", 20093);

INSERT INTO trasportatore VALUES(1, "Giuseppe", "Rossi");
INSERT INTO trasportatore VALUES(2, "Mario", "Bianchi");
INSERT INTO trasportatore VALUES(3, "Antonio", "Verdi");
INSERT INTO trasportatore VALUES(4, "Marco", "Gialli");
INSERT INTO trasportatore VALUES(5, "Giuseppe", "Aranci");

INSERT INTO missiva (id_missiva, peso, descrizione, lunghezza, larghezza, profondita, qr_link, firma_mittente, firma_destinatario, id_fk_mittente, data_invio, id_fk_destinatario,data_ricezione) 
VALUES(1, 2, "pacco bomba", 20, 20, 20, "http://bla_bla_bla.com", "firma_mittente.png", "firma_destinatario.png", 2, 1707576190, 3, 1708440190);


INSERT INTO transita (id_transita,data_transito,tipo,id_fk_trasportatore, id_fk_sede, id_fk_missiva) 
VALUES(1, 1707662590, 0, 1, 6, 1);
INSERT INTO transita (id_transita,data_transito,tipo,id_fk_trasportatore, id_fk_sede, id_fk_missiva) 
VALUES(2, 1707748990, 1, 2, 6, 1);
INSERT INTO transita (id_transita,data_transito,tipo,id_fk_trasportatore, id_fk_sede, id_fk_missiva) 
VALUES(3, 1707781390, 0, 3, 3, 1);
INSERT INTO transita (id_transita,data_transito,tipo,id_fk_trasportatore, id_fk_sede, id_fk_missiva) 
VALUES(4, 1707820990, 1, 3, 3, 1);
INSERT INTO transita (id_transita,data_transito,tipo,id_fk_trasportatore, id_fk_sede, id_fk_missiva) 
VALUES(5, 1707910990, 0, 4, 8, 1);
INSERT INTO transita (id_transita,data_transito,tipo,id_fk_trasportatore, id_fk_sede, id_fk_missiva) 
VALUES(6, 1708170190, 1, 4, 8, 1);
INSERT INTO transita (id_transita,data_transito,tipo,id_fk_trasportatore, id_fk_sede, id_fk_missiva) 
VALUES(7, 1708202590, 0, 5, 7, 1);
INSERT INTO transita (id_transita,data_transito,tipo,id_fk_trasportatore, id_fk_sede, id_fk_missiva) 
VALUES(8, 1708411390, 1, 5, 7, 1);

