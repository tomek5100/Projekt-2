import './App.css';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom'
import Home from './pages/Home'
import Restauracja from './pages/Restauracja'
import Logowanie from './pages/Logowanie'
import Rejstracja from './pages/Rejstracja'
import Kurier from './pages/Kurier'
import Zamówienie from './pages/Zamówienie'
import { Container, Row, Col } from 'react-bootstrap'

function App() {
	return (
		<div className='root'>
			<Router>
				<div className='naglowek'>
					<Container>
						<Row>
							<Col md='4'></Col>
							<Col md='4' className='nazwa'>
								<h1>Pyszne 2.0</h1>
							</Col>
							<Col md='4'></Col>
						</Row>
					</Container>
				</div>
				<Routes>
					<Route path='/' exact element={<Home />} />
					<Route path='/restauracja/:id' exact element={<Restauracja />} />
					<Route path='/login' exact element={<Logowanie />} />
					<Route path='/register' exact element={<Rejstracja />} />
					<Route path='/kurier' exact element={<Kurier />} />
					<Route path='/zamowienie' exact element={<Zamówienie />} />
				</Routes>
				<div className='bottom'>
					<Container>
						<Row>
							<Col md='6'>
								<p>
									<Link to='/login'>Kurier - logowanie</Link>
								</p>
								<p>
									<Link to='/register'>Rejstracja</Link>
								</p>
								<p>
									<Link to='/'>Restauracje</Link>
								</p>
							</Col>
							<Col md='6'>
								<p>Szweska 1/1<br></br>12-345 Krakow</p>
								<p>123 456 789</p>
							</Col>
						</Row>
					</Container>
				</div>
			</Router>
		</div>
	)
}

export default App;
