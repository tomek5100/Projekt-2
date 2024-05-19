import React from 'react'
import { Container, Row } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'

function Rejstracja() {
	
	let navigate = useNavigate()
	
	return (
		<main>
			<Container className='wrapper-login'>
				<div className='duzy-przycisk'>
					<p onClick={() => {navigate('/')}}>Powrót do strony głównej</p>
				</div>
				<Row>
				</Row>
				<Row>
                    <h2>Rejstracja niedostępna, kuriera musi zarejstrować administrator</h2>
				</Row>
			</Container>
		</main>
	)
}

export default Rejstracja
