package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import entity.Employee;

public class employeeService {
private static List<Employee> employeeList= new ArrayList<Employee>();

public void initiaizeEmployee() {
	Employee e1=new Employee();
	e1.setAdmin(false);
	e1.setEmpId(101);
	e1.setFirstName("piyush");
	e1.setLastName("kag");
	e1.setPassword("123");
	e1.setUserName("piyush");
	e1.setSalary(100000);
	employeeList.add(e1);
	
	Employee e2 = new Employee();
	e2.setAdmin(true);
	e2.setEmpId(102);
	e2.setFirstName("Aditya");
	e2.setLastName("gupta");
	e2.setPassword("321");
	e2.setUserName("bbb");
	e2.setSalary(100000);
	employeeList.add(e2);
}
public Employee login(String userName, String passWord) {
	Optional<Employee> emp = employeeList.stream().filter(employeeList -> employeeList.getUserName().equals(userName) && employeeList.
			getPassword().equals(passWord)).findFirst();
	if(emp.isPresent())return emp.get();
	return null;
}
public List<Employee> getEmployee(){
	return employeeList;
}

}
