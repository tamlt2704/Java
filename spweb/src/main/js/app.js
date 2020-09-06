'use strict';

import React, {useState, useRef, useEffect} from 'react';
const ReactDOM = require('react-dom');
const client = require('./client');
import props from 'prop-types';

import EmployeeList from './components/EmployeeList';
import Employee from './components/Employee';


function App() {
	const [employees, setEmployees] = useState([]);
	
	useEffect(() => {
		client({method: 'GET', path: '/api/employees'})
		.done(response => {
			console.log(response);
			setEmployees(response.entity._embedded.employees);
		});
	}, [])
	
	return (
		<>
			<EmployeeList employees={employees}/>
		</>
	) 
}

ReactDOM.render(
	<App />,
	document.getElementById('react')
)