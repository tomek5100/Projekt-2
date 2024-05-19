import React, { useEffect, useState } from 'react'
import { Container, Row, Col } from 'react-bootstrap'
import axios from 'axios'
import { useNavigate } from 'react-router-dom'

function Zamówienie() {
	
	const navigate = useNavigate()
	
	const [czas, ustawCzas] = useState([])
	const [zamówienie, pobierzZamówienie] = useState([])
	
	useEffect (() => {
		
		const kod = window.sessionStorage.getItem('kod');
		
		// użytkownik nie ma zapisanego w sesji kodu zamówienia
		if (!kod) {
			navigate('/')
			return
		}
		
		let interval = null;
		interval = setInterval(() => {
			ustawCzas(czas => czas + 5);
		}, 1000);
		
		axios.get(`http://localhost:3001/zamowienia/status/${kod}`).then((response) => {
			pobierzZamówienie(response.data)
		})
		
		return () => clearInterval(interval);
	}, [czas, navigate])
	

	
	return (
		<main>
			<Container>
				{zamówienie.map((zamówienie_dane, key) => {
					return (
						<div key={ key }>
							<Row>
								<h1 className='text-center'>Status zamówienia #{zamówienie_dane.id}</h1>
							</Row>
							<hr></hr>
							<Row>
								<Col md='6'>
									<h2>Restauracja</h2>
									<p>{zamówienie_dane.restauracja.nazwa}</p>
									<h2>Zamówienie</h2>
									<ul>
										{ zamówienie_dane.dania.map ((danie, danie_key) => {
											return (
												<li key={ danie_key }>{danie.nazwa} x{danie.zamówienie_danie.ilość} - {(danie.cena * danie.zamówienie_danie.ilość).toFixed(2)} zł</li>
											)
										})
										}
									</ul>
									<h2>Łącznie</h2>
									<p>{zamówienie_dane.cena} zł</p>
								</Col>
								<Col md='6'>
									<h2>Podany adres</h2>
									<p>{zamówienie_dane.miasto}<br></br>{zamówienie_dane.ulica} {zamówienie_dane.numer_mieszkania}</p>
								</Col>
							</Row>
							<hr></hr>
							<Row>
								<h2 className='text-center'>Status zamówienia: {zamówienie_dane.status}</h2>
								{ (() => {
									if (zamówienie_dane.status === 'złożone') {
										return (
											<div>
												<p className='text-center zamówienie-status zamówienie-status-złożone'>Przyjeliśmy twoje zamówienie</p>
											</div>
										)
									} else if (zamówienie_dane.status === 'w trakcie') {
										return (
											<p className='text-center zamówienie-status zamówienie-status-w-trakcie'>Kurier odebrał twoje zamówienie i jest w drodze</p>
										)
									} else if (zamówienie_dane.status === 'zrealizowane') {
										return (
											<div>
												<p className='text-center zamówienie-status zamówienie-status-zrealizowane'>Twoje zamówienie zostało zrealizowane!</p>
												<button>Powrót do strony głównej</button>
											</div>
										)
									}
								})() }
							</Row>
						</div>
					)
				})}
			</Container>
		</main>
	)
}

export default Zamówienie