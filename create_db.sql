CREATE TABLE cliente (
        id_cliente INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        cognome TEXT NOT NULL,
        email TEXT NOT NULL,
        indirizzo TEXT NOT NULL,
        cap INTEGER NOT NULL
);

CREATE TABLE missiva (
        id_missiva INTEGER PRIMARY KEY,
        peso INTEGER NOT NULL,
        descrizione TEXT,
        lunghezza INTEGER NOT NULL,
        larghezza INTEGER NOT NULL,
        profondita INTEGER NOT NULL,
        qr_link TEXT,
        firma_mittente TEXT,
        firma_destinatario TEXT,
        id_fk_mittente INTEGER,
        data_invio INTEGER,
        id_fk_destinatario INTEGER,
        data_ricezione INTEGER,
        FOREIGN KEY (id_fk_mittente)
            REFERENCES cliente (id_cliente)
            ON DELETE CASCADE
            ON UPDATE NO ACTION
        FOREIGN KEY (id_fk_destinatario)
            REFERENCES cliente (id_cliente)
            ON DELETE CASCADE
            ON UPDATE NO ACTION
);

CREATE TABLE sede (
        id_sede INTEGER PRIMARY KEY,
        citta TEXT NOT NULL,
        nome TEXT NOT NULL
);

CREATE TABLE trasportatore (
        id_trasportatore INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        cognome TEXT NOT NULL,
        telefono INTEGER NOT NULL
);

CREATE TABLE transita (
		id_transita INTEGER PRIMARY KEY,
        data_transito INTEGER NOT NULL,
        tipo INTEGER NOT NULL,
        id_fk_trasportatore INTEGER,
        id_fk_sede INTEGER,
        id_fk_missiva INTEGER,
		FOREIGN KEY (id_fk_trasportatore)
            REFERENCES trasportatore (id_trasportatore)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
        FOREIGN KEY (id_fk_sede)
            REFERENCES sede (id_sede)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
		FOREIGN KEY (id_fk_missiva)
            REFERENCES missiva (id_missiva)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);
	