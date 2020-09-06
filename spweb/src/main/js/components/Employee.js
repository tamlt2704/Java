/**
 * http://usejsdoc.org/
 */
import React from 'react';

function EmployeeList({employee}) {
	return (
		<>
			<tr>
				<td>{employee.firstName}</td>
				<td>{employee.lastName}</td>
				<td>{employee.description}</td>
			</tr>
		</>
	);
}

export default EmployeeList;