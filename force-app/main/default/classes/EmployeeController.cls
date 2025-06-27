public without sharing class EmployeeController {
  @InvocableMethod(
    label='Get Employee List'
    description='Retrieves all Employee records with their Id, Name__c, and Salary__c'
  )
  public static List<EmployeeResponse> getEmployees(List<String> input) {
    List<EmployeeResponse> responses = new List<EmployeeResponse>();

    // Query employees with Id
    List<Employee__c> employees = [
      SELECT Id, Name__c, Salary__c
      FROM Employee__c
    ];

    EmployeeResponse response = new EmployeeResponse();
    response.employeeList = new EmployeeList();
    response.employeeList.employees = new List<Employee>();

    for (Employee__c emp : employees) {
      response.employeeList.employees.add(
        new Employee(emp.Id, emp.Name__c, String.valueOf(emp.Salary__c))
      );
    }

    responses.add(response);
    return responses;
  }

  public class EmployeeResponse {
    @InvocableVariable
    public EmployeeList employeeList;
  }

  public class EmployeeList {
    @InvocableVariable
    public List<Employee> employees;
  }

  public class Employee {
    @InvocableVariable
    public String id;
    @InvocableVariable
    public String nameCustom;
    @InvocableVariable
    public String salary;

    public Employee(String id, String nameCustom, String salary) {
      this.id = id;
      this.nameCustom = nameCustom;
      this.salary = salary;
    }
  }
}
