const express = require("express");
const app = express();
const port = 3333;

const sqlite3 = require('sqlite3').verbose();
let db = new sqlite3.Database(__dirname + "/test.db");


const nunjucks = require('nunjucks');
app.set("view engine", "html");
nunjucks.configure(__dirname, {
    autoescape: true,
    express: app
});

app.listen(port, () => {
    console.log(`Server listening on port: ${port}`);
});

app.get("/api/missive/:userid", (req, res) => {
    const userid = req.params.userid;
    db.all(`SELECT missiva.id_missiva as id, cliente.nome, cliente.cognome FROM missiva 
    JOIN cliente ON missiva.id_fk_destinatario = cliente.id_cliente
    WHERE missiva.id_fk_mittente = ?`, [userid],
    (error, rows) => {
        if(error){
            console.error(error.message);
        }
        /*
        rows.forEach((row) => {
            console.log(`${row.id} ${row.nome} ${row.cognome}`);
        })
        */
        res.render(
            'elenco_missive.html', 
            { 
                title : `Elenco missiva utente ${userid}`,
                rows: rows
            }
        );
    });
});

function timestamp2time(timestamp) {
    let time = new Date(timestamp*1000).toLocaleTimeString("it-IT");
    let data = new Date(timestamp*1000).toLocaleDateString("it-IT");
    return `${data} ${time}`;
}

app.get("/api/transito/:missivaid", (req, res) => {
    const missivaid = req.params.missivaid;
    db.all(`SELECT missiva.id_missiva as idmissiva, 
    transita.id_transita as idtransita, transita.tipo, transita.data_transito as data, 
    sede.citta, 
    trasportatore.id_trasportatore, trasportatore.cognome
    FROM missiva
    JOIN transita ON missiva.id_missiva = transita.id_fk_missiva
    JOIN sede ON transita.id_fk_sede = sede.id_sede
    JOIN trasportatore ON transita.id_fk_trasportatore = trasportatore.id_trasportatore
    where missiva.id_missiva = ?
    ORDER BY data_transito;`, [missivaid],
    (error, rows) => {
        if(error){
            console.error(error.message);
        }
        /*
        rows.forEach((row) => {
            console.log(`${row.idtransita} ${row.tipo} ${row.data} ${row.citta} ${row.cognome}`);
        })
        */
        
        res.render(
            'elenco_transita.html', 
            { 
                title : `Elenco transita missiva ${missivaid}`,
                rows: rows,
                timeConverter: timestamp2time
        });
        
    });
});