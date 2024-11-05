using {com.nayar as call}  from '../db/schema';

service EmployeeService{
    entity Employees as projection on call.Employees;
};