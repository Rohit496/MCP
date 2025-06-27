@isTest
public class EmployeeControllerTest {
  @isTest
  static void testGetEmployees() {
    // Create sample employee records
    List<Employee__c> employeeRecords = new List<Employee__c>();
    for (Integer i = 1; i <= 3; i++) {
      employeeRecords.add(
        new Employee__c(Name__c = 'Employee ' + i, Salary__c = 5000 * i)
      );
    }
    insert employeeRecords;

    // Prepare input for the Invocable method (even though it's not used in the method)
    List<String> input = new List<String>{ 'dummy' };

    // Call the method
    Test.startTest();
    List<EmployeeController.EmployeeResponse> result = EmployeeController.getEmployees(
      input
    );
    Test.stopTest();

    // Assertions
    System.assertEquals(
      1,
      result.size(),
      'Only one response object should be returned'
    );
    EmployeeController.EmployeeResponse response = result[0];
    System.assertNotEquals(
      null,
      response.employeeList,
      'EmployeeList should not be null'
    );
    System.assertEquals(
      3,
      response.employeeList.employees.size(),
      'Should return 3 employees'
    );

    for (Integer i = 0; i < 3; i++) {
      System.assertEquals(
        employeeRecords[i].Name__c,
        response.employeeList.employees[i].nameCustom
      );
      System.assertEquals(
        String.valueOf(employeeRecords[i].Salary__c),
        response.employeeList.employees[i].salary
      );
      System.assertEquals(
        employeeRecords[i].Id,
        response.employeeList.employees[i].id
      );
    }
  }
}
