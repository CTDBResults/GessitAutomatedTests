Feature: some feature
@wip

  Scenario Outline: GES-172 As Specialist, I want the ability to add treatment tasks to an approved treatment plan
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Tasks" page
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    And I click on " My Patients"
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value      |
      | searchtextInput | <LastName> |
    And I hit Enter
    Then I see text "<LastName>" displayed
    And I click on "<FirstName>"
    And I wait for "1000" millisecond
    And I check I am on "Patient Profile" page
    And I click on "Edit Patient Details "
    And I click on "Treatment Plans"
    Then I see text "Treatment Plan (Approved)" displayed
    # GES-172 As a GP/Specialist, I want the ability to add treatment tasks to an approved treatment plan
    Then I click on image "addNew"
    And I see popup "modal-content" displayed
    And I click on button "saveTask"
    #  Scenario 2: Mandatory fields not filled in
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                    |
      | item1 | Task Name is mandatory      |
      | item2 | Due Days is mandatory       |
      | item3 | Type is mandatory           |
      | item4 | Responsibility is mandatory |
      | item5 | Description is mandatory    |
    And I click on button "typedropdown"
    And on popup I select "Appointment" from "typedropdown"
    And I click on button "responsibilitydropdown"
    And on popup I select "James Kildare" from "responsibilitydropdown"
    # Babu to add the id to description field.
    And I enter popup values as
      | Fields             | Value                 |    
      | duedays            |                     3 |
      | addTaskDescription | automate and get lazy |
      And I enter pop field "taskName" as "jungle main oye oye"
    And I click on button "saveTask"
    Then I see text "jungle main oye oye" displayed
   

    # Test16402
    Examples: 
      | PortalName | email                       | Password | FirstName      | EmailInput   | LastName           | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfour | abwc@abc.com | PatientIsCirrhotic |    042211111 |        7 |     2222 |       40 |  50 |       20 | Complications |
