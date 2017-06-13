Feature: WIP

  @wip
   Scenario Outline: GES-529 As a GP/Specialist, I want the ability to save the draft treatment plan to view that at a later stage
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
    Then I see text "<FirstName>" displayed
    And I click on "<FirstName>"
    And I wait for "1000" millisecond
    And I check I am on "Patient Profile" page
    And I click on "Edit Patient Details "
    And I click on "Treatment Options"
    And I check I am on "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    # DCP-227:As a GP/Specialist, I want the ability to discard a draft  Scenario2: User selects No
    Then I "check" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    And I check I am on "Treatment Plans" page
    And I wait for "1000" millisecond
    And I wait for "2000" millisecond
    And I click on "Save Draft"
    And I click on "Discard Draft"
    Then I see text "Are you sure you want to Discard this Draft Treatment Plan?" displayed
   And I click on button "yes-button"
    Then I see text "Back" displayed
    # GES-529 : Scenario 3: User doesn’t not save a draft copy
    And I click on "Back"
    And I check I am on "Fibrosis Assessment" page
    And I click on "Submit Assessment"
    # GES-529 : Scenario 4: User selects a ‘Submit button
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    # DCP-227:As a GP/Specialist, I want the ability to discard a draft  Scenario2: User selects No
    Then I "check" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    And I check I am on "Treatment Plans" page
    And I click on "Submit"
    And I wait for "1000" millisecond
    And I click on "Approve Plan"
    And I wait for "2000" millisecond
    Then I see text "Treatment Plan (Approved)" displayed

    # To do add further validation by going to My Taskpage and add validation. Currently in error.
    #Test16402
    Examples: 
      | PortalName | email                       | Password | FirstName                           | EmailInput   | LastName                 | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfourSpecilToApproveprodtt | abwc@abc.com | PatientIsCirrhoticprodtt |    042211111 |        7 |     2222 |       40 |  50 |       20 | Complications |
