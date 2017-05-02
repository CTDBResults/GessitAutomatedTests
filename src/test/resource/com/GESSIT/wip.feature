Feature: some t

  @wip
  Scenario Outline: GES-172 As a GP/Specialist, I want the ability to add treatment tasks to an approved treatment plan
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
    And I check I am on "My Patients" page
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value      |
      | searchtextInput | <LastName> |
    And I hit Enter
    Then I see text "<FirstName>" displayed
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
    And on popup I select "Victor Chang" from "responsibilitydropdown"
    # Babu to add the id to description field.
    And I click on button "Description *"

    #  Scenario 1: User views the â€˜Add Taskâ€™ pop-up
    #  Scenario 2: Mandatory fields not filled in
    #  Scenario 3: Mandatory fields filled in
    #  Scenario 4: New task added by GP
    #   Scenario 5: New task added by Specialist
    # Test16402
    Examples: 
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName           | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demospecialist123@gmail.com | pass123  | pass123   | abwc@abc.com | PatientIsCirrhotic |    042211111 |      786 |     2222 |       40 |  50 |       20 | Complications |
