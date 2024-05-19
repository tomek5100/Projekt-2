const express = require ('express')
const router = express.Router ()
const { restauracje, dania } = require ('../models')

router.get('/', async (req, res) => {
	const listaRestauracji = await restauracje.findAll ();
	res.json(listaRestauracji)
})

router.get('/id/:id', async (req, res) => {
	const id = req.params.id
	const restauracja = await restauracje.findAll({
		include: [
			{
				model: dania,
				attributes: ['id', 'nazwa', 'cena'],
				as: 'dania'
			}
		],
		where: {
			id: id
		}
	})
	res.json(restauracja)
})

router.post('/', async (req, res) => {
	const restauracja = req.body
	await restauracje.create(restauracja)
	res.json(restauracja)
})

module.exports = router