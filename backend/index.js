const express = require('express')
const app = express()
const cors = require('cors')

app.use(express.json())
app.use(cors());

const db = require ('./models')

const restauracjeRouter = require ('./routes/restauracje')
app.use("/restauracje", restauracjeRouter);
const zamówieniaRouter = require ('./routes/zamowienia')
app.use("/zamowienia", zamówieniaRouter);
const menuRouter = require ('./routes/menu')
app.use("/menu", menuRouter);
const użytkownicyRouter = require ('./routes/autoryzacja')
app.use("/auth", użytkownicyRouter);
const kurierzyRouter = require ('./routes/kurierzy')
app.use("/kurier", kurierzyRouter);

db.sequelize.sync().then(() => {
	app.listen(3001, () => {
		console.log("Uruchomiono serwer na porcie 3001");
	})
})