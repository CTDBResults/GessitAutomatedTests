Feature: some feature

  #take firstname from above
  @wip

 Scenario Outline: Set 2..... login as gp.......Create NC....... approve
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    And I click on "Create New Patient"
    And I enter the details as
      | Fields         | Value          |
      | FirstName      | <FirstName>    |
      | EmailInput     | <EmailInput>   |
      | LastNameInput  | <LastName>     |
      | contactInput   | <contactInput> |
      | medicareInput  | <medicare>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I wait for "1000" millisecond
    And I use "DOB" to enter "12122001"
    And I select "<CU>" from "Care Unit"
    And I select "Male" from "Gender"
    And I click on "Create Patient"
    And I click on "Next"
    And I check I am on "Medications" page
    And I click on "Next"
    And I check I am on "Diagnosis" page
    And I click on "Add HCV diagnosis"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                      |
      | item1 | Chronic Hepatitis C Infection |
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Adelaide - James Kildare (Oncologist)" from "Specialist"
   # And I select "Darwin - Torsten Wiesel (GP)" from "GP"
    And I click on "Save"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName       |
      | item1 | James Kildare  |
      | item2 | Torsten Wiesel |
    And I click on "Next"
    And I check I am on "Medical History" page
    And I click on "diabetesyes" radio option
    And I click on "obesityyes" radio option
    And I click on "hepatitisyes" radio option
    And I click on "renalfailno" radio option
    And I click on "contraceptionno" radio option
    And I click on "hivno" radio option
    And I click on "Next"
    And I check I am on "Current Medications" page
    And I click on "Next"
    And I click on "Next"
    And I check I am on "HepC History" page
    And I click on "genotype2" radio option
    And I select "2015" from "acquisitionInput"
    And I click on "Tattoos" checkbox
    And I click on "opioidyes" radio option
    And I click on "genotype1a" radio option
    And I click on "viralload6mless" radio option
    And I click on "previoustherapyno" radio option
    And I click on "Next"
    And I check I am on "Fibrosis Assessment" page
    And I enter the details as
      | Fields   | Value      |
      | aprilevl | <aprilevl> |
      | ast      | <ast>      |
      | Platelet | <Platelet> |
    Then I see text "<Message>" displayed
    And I click on "Submit Assessment"
    Then I see text "Based on the information" displayed
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Back     |
      | item1 | Continue |
    And I click on "Continue"
    And I check I am on "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    Then I see text "Treatment Plan (New)" displayed
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | item1 | Save Draft |
    Then I click on "Submit"
    And I click on text "Approve Treatment Plan as a GP"
    And I click on button "sendRequestNonCirrhosis"
    Then I see text "Treatment Plan (Approved)" displayed

    Examples: 
      | PortalName | email               | Password | FirstName | EmailInput   |CU| LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message |
      | Gessit     | demogp123@gmail.com | pass123  | SetTwo    | abwc@abc.com | Bay|GAP      |   0422000000 |        7 |     2222 |       40 |  50 |      200 |         |
 @wip
  Scenario Outline: Set 4..... login as specialist.......create a draft (NC)....... approve
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    And I click on "Create New Patient"
    And I enter the details as
      | Fields         | Value          |
      | FirstName      | <FirstName>    |
      | EmailInput     | <EmailInput>   |
      | LastNameInput  | <LastName>     |
      | contactInput   | <contactInput> |
      | medicareInput  | <medicare>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I wait for "1000" millisecond
    And I use "DOB" to enter "12122001"
    And I select "<CU>" from "Care Unit"
    And I select "Male" from "Gender"
    And I click on "Create Patient"
    And I click on "Next"
    And I check I am on "Medications" page
    And I click on "Next"
    And I check I am on "Diagnosis" page
    And I click on "Add HCV diagnosis"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                      |
      | item1 | Chronic Hepatitis C Infection |
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Adelaide - James Kildare (Oncologist)" from "Specialist"
    #And I select "Darwin - Torsten Wiesel (GP)" from "GP"
    And I click on "Save"
    And I click on "Next"
    And I check I am on "Medical History" page
    And I click on "diabetesyes" radio option
    And I click on "obesityyes" radio option
    And I click on "hepatitisyes" radio option
    And I click on "renalfailno" radio option
    And I click on "contraceptionno" radio option
    And I click on "hivno" radio option
    And I click on "Next"
    And I check I am on "Current Medications" page
    And I click on "Next"
    And I click on "Next"
    And I check I am on "HepC History" page
    And I click on "genotype2" radio option
    And I select "2015" from "acquisitionInput"
    And I click on "Tattoos" checkbox
    And I click on "opioidyes" radio option
    And I click on "genotype1a" radio option
    And I click on "viralload6mless" radio option
    And I click on "previoustherapyno" radio option
    And I click on "Next"
    And I check I am on "Fibrosis Assessment" page
    And I enter the details as
      | Fields   | Value      |
      | aprilevl | <aprilevl> |
      | ast      | <ast>      |
      | Platelet | <Platelet> |
    Then I see text "<Message>" displayed
    And I click on "Submit Assessment"
    And I check I am on "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    Then I see text "Treatment Plan (New)" displayed
    And I click on "Save Draft"
    And I wait for "1000" millisecond
    Then I see text "Treatment Plan (Draft)" displayed
    Then I click on "Submit"
    And I click on text "Are you sure you want to approve and initiate this treatment plan?"
    And I click on "Approve Plan"
    Then I see text "Treatment Plan (Approved)" displayed

    Examples: 
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName | contactInput |CU| medicare | postCode | aprilevl | ast | Platelet | Message |
      | Gessit     | demospecialist123@gmail.com | pass123  | SetTwo    | abwc@abc.com | GAP      |   0422000000 |Royal |       7 |     2222 |       40 |  50 |      200 |         |
















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
