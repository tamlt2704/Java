/**
 * http://usejsdoc.org/
 */

import React from 'react';
import Employee from './Employee';

function EmployeeList({ employees }) {
	const employeesList = employees.map(employee => <Employee employee={employee} key={employee._links.self.href} />);

	return (
		<>
			<table>
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					{employeesList}
				</tbody>
			</table>
		</>
	);
};


export default EmployeeList;