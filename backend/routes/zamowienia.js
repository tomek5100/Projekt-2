const express = require ('express')
const router = express.Router ()
const { zamówienia, restauracje, zamówienie_danie, dania } = require ('../models')

router.post('/kurier/przyjete', async (req, res) => {
	const { id_kurier, token } = req.body
	
	if (token != 'fdfsgnb5tg;vnse54t354$$tgn:434R') {
		res.json ({
			error: 'Te dane dostępne są jedynie dla kurierów!'
		})
		return
	}
	
	if (!id_kurier) {
		res.json ({
			error: 'Nie podano ID kuriera'
		})
		return
	}
	
	const listaZamówień = await zamówienia.findAll ({
		include: [
			{
				model: restauracje,
				attributes: ['nazwa'],
				as: 'restauracja'
			},
			{
				model: dania,
				attributes: ['nazwa', 'cena'],
				as: 'dania'
			}
		],
		where: {
			id_kurier: id_kurier,
			status: 'w trakcie'
		}
	});
	
	res.json(listaZamówień)
})

router.post('/kurier/zrealizowane', async (req, res) => {
	const { id_kurier, token } = req.body
	
	if (token != 'fdfsgnb5tg;vnse54t354$$tgn:434R') {
		res.json ({
			error: 'Te dane dostępne są jedynie dla kurierów!'
		})
		return
	}
	
	if (!id_kurier) {
		res.json ({
			error: 'Nie podano ID kuriera'
		})
		return
	}
	
	const listaZamówień = await zamówienia.findAll ({
		include: [
			{
				model: restauracje,
				attributes: ['nazwa'],
				as: 'restauracja'
			},
			{
				model: dania,
				attributes: ['nazwa', 'cena'],
				as: 'dania'
			}
		],
		where: {
			id_kurier: id_kurier,
			status: 'zrealizowane'
		}
	});
	
	res.json(listaZamówień)
})

router.post('/dostepne', async (req, res) => {
	
	const { token } = req.body
	
	if (token != 'fdfsgnb5tg;vnse54t354$$tgn:434R') {
		res.json ({
			error: 'Te dane dostępne są jedynie dla kurierów!'
		})
		return
	}
	
	const listaZamówień = await zamówienia.findAll ({
		include: [
			{
				model: restauracje,
				attributes: ['nazwa'],
				as: 'restauracja'
			},
			{
				model: dania,
				attributes: ['nazwa', 'cena'],
				as: 'dania'
			}
		],
		where: {
			status: 'złożone'
		}
	});
	
	res.json(listaZamówień)
})

router.get('/status/:kod', async (req, res) => {
	const kod = req.params.kod
	const zamówienie = await zamówienia.findAll({
		include: [
			{
				model: restauracje,
				attributes: ['nazwa'],
				as: 'restauracja'
			},
			{
				model: dania,
				attributes: ['nazwa', 'cena'],
				as: 'dania'
			}
		],
		where: {
			kod: kod
		}
	})
	res.json (zamówienie)
})

router.post('/nowe', async (req, res) => {
	const zamówienie_dane = req.body
	
	const zamówienie = {
		miasto: zamówienie_dane.miasto,
		ulica: zamówienie_dane.ulica,
		numer_mieszkania: zamówienie_dane.numer_mieszkania,
		cena: zamówienie_dane.cena,
		kod: zamówienie_dane.kod,
		id_restauracja: zamówienie_dane.id_restauracja,
		status: 'złożone'
	}
	
	const zamówienie_res = await zamówienia.create(zamówienie)
	
	for (const [key, value] of Object.entries(zamówienie_dane.dania)) {
		zamówienie_danie_dane = {
			ilość: value.ilość,
			id_danie: value.id_danie,
			id_zamówienie: zamówienie_res.id,
			kod: zamówienie_dane.kod,
		}
		await zamówienie_danie.create(zamówienie_danie_dane)
	}
	
	res.json({
		message: 'Pomyślnie złożono zamówienie'
	})
})

module.exports = router