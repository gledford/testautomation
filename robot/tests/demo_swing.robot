*** Settings ***
Documentation      Test Cases for Dunder Mifflin Employee GUI
Library            RemoteSwingLibrary    # A library for testing and connecting to a java process and using SwingLibrary.
Suite Setup        Setup
Suite Teardown     Teardown

*** Test Cases ***
Add Employee
    Add New Employee In Accounting
    Select Context              UserListPanel
    ${employee_count}=          Get Table Row Count     UserTable
    Should Be Equal As Integers     1       ${employee_count}

Remove Employee
    Remove Accounting Employee
    Select Window               regexp=^Java.*
    Select Context              UserListPanel
    ${employee_count}=          Get Table Row Count     UserTable
    Should Be Equal As Integers     0       ${employee_count}

Add Employee And Assign A Role
    Add New Employee In Accounting
    Select Context              UserListPanel
    Select Table Cell           UserTable   0   0
    Select Window               regexp=^Java.*
    Select Context              RolePanel
    Select From Dropdown Menu   RoleList      Payroll
    Push Button                 Add
    List Should Contain         SelectedRoleList    Payroll
    Remove Accounting Employee


*** Keywords ***
Setup
#    Start Application           DEMO    java -jar /Users/gledford/git/java-swing-mva-demo/target/app.jar
    Start Application           DEMO    java -jar /root/sut/app.jar

Teardown
    System exit

Add New Employee In Accounting
    Select Window               regexp=^Java.*
    Push Button                 New
    Insert Into Text Field      FirstNameField      Kevin
    Insert Into Text Field      LastNameField       Malone
    Insert Into Text Field      UserNameField       kmalone
    Insert Into Text Field      PasswordField       password
    Insert Into Text Field      PasswordConfirmField    password
    Insert Into Text Field      EmailField          kmalone@dundermifflin.com
    Select From Dropdown Menu   DepartmentList      Accounting
    Push Button                 Save Profile

Remove Accounting Employee
    Select Window               regexp=^Java.*
    Select Context              UserListPanel
    Select Table Cell           UserTable   0   0
    Push Button                 Delete
    Select Dialog               regexp=^Delete.*
    Push Button                 OK