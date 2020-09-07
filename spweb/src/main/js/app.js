'use strict';

import React, { useState, useRef, useEffect } from 'react';
const ReactDOM = require('react-dom');
/*const client = require('./client');*/
import props from 'prop-types';

import EmployeeList from './components/EmployeeList';
import Employee from './components/Employee';
const axios = require('axios');
const root = '/api';

function App() {
	const [employees, setEmployees] = useState([]);
	const [pageSize, setPageSize] = useState(2);
	const [pageNumber, setPageNumber] = useState(0);

	const loadFromServer = (pageSize) => {
		axios({
			method: 'get',
			url: `${root}/employees?page=${pageNumber}&size=${pageSize}`
		})
			.then((response) => {
				console.log(response);
				setEmployees(response?.data?._embedded?.employees);
			});
	}

	useEffect(() => {
		loadFromServer(pageSize);
	}, [pageSize])

	return (
		<>
			<EmployeeList employees={employees} />
			<input
				type="text"
				value={pageSize}
				onChange={(e) => {
					setPageSize(e.target.value);
				}}
			/>
		</>
	)
}

ReactDOM.render(
	<App />,
	document.getElementById('react')
)