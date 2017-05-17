 
Feature: some feature

 Scenario Outline: GES-164 , Also covers E2E scenarios
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
    And I click on "Create New Patient"
    And I wait for "1000" millisecond
    And I see popup "consentModal" displayed
    And I wait for "1000" millisecond
    And I click on "agreeButton" on popup
    And I wait for "1000" millisecond
    And I click on "Create Patient"
    And I check I am on "Personal Details" page
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
    And I use "DOB" to enter "12122001"
    And I select "<CU>" from "Care Unit"
    And I select "Male" from "Gender"
    And I click on "Create Patient"
    And I check I am on "Personal Details" page
    Then I click on "Next"
    And I check I am on "Medications" page
    And I enter the details as
      | Fields                | Value |
      | searchMedicationInput | el    |
    And I wait for "2000" millisecond
    And I hit Enter
    Then I click on "Add"
    And I enter the details as
      | Fields    | Value       |
      | frequency | twice a day |
    And I wait for "1000" millisecond
    Then I click on button "addMedication"
    And I wait for "1000" millisecond
    Then I click on "Next"
    And I click on "Add HCV diagnosis"
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Victor Chang" from "Specialist"
    And I select "Doctor Who" from "GP"
    And I click on "Next"
    And I click on "diabetesyes" radio option
    And I click on "obesityyes" radio option
    And I click on "hepatitisyes" radio option
    And I click on "renalfailyes" radio option
    And I click on "contraceptionno" radio option
    And I click on "hivno" radio option
    And I click on "Next"
    And I check I am on "Current Medications" page
    And I click on "Next"
    And I check I am on "HepC History" page
    And I click on "genotype2" radio option
    #And I enter the details as
    #| Fields           | Value |
    #| acquisitionInput |  2000 |
    And I select "2015" from "acquisitionInput"
    And I click on "Unknown" checkbox
    And I click on "opioidyes" radio option
    And I click on "genotype1a" radio option
    And I click on "viralload6mless" radio option
    And I click on "previoustherapyno" radio option
    And I click on "Next"
    # Scenario 3 : Check mandatory fields
    And I click on "Submit Assessment"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                 |
      | item1 | Validation Errors                        |
      | item1 | AST Level is mandatory                   |
      | item1 | AST (Upper limit of normal) is mandatory |
      | item1 | Platelet count is mandatory              |
      | item1 | APRI Score is mandatory                  |
      | item1 | Cirrohsis diagnosed is mandatory         |
    # Scenario 1: system will return a result of Cirrhosis and record the result against the algorithm
    # 40, 50, 200 will trigger no and 40,50,20 will trigger yes
    And I check I am on "Fibrosis Assessment" page
    And I enter the details as
      | Fields   | Value      |
      | aprilevl | <aprilevl> |
      | ast      | <ast>      |
      | Platelet | <Platelet> |
    # as part of bug  specialist should not see this message when non cirrotic.
    Then I see text "<Message>" displayed
    Then I click on "Save"

    #Ges-164
    Examples: 
      | PortalName | email                       | Password | FirstName                     | EmailInput   | LastName           | CU    | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
    #  | Gessit     | demogp123@gmail.com         | pass123  | TestOnesixfour                | abwc@abc.com | NOTCirrhotic       | Bay   |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |
   #  | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfour                | abwc@abc.com | NOTCirrhotic       | Royal |   0422000000 |        7 |     2222 |       40 |  50 |      200 |               |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfourSpecilToApprove | abwc@abc.com | PatientIsCirrhotic | Royal |    042211111 |        7 |     2222 |       40 |  50 |       20 | Complications |

  Scenario Outline: Search for the person created above
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
    And I click on "Fibrosis/ Cirrhosis Assessment"
     And I scroll "down" the page
    And I enter the details as
      | Fields   | Value      |
      | aprilevl | <aprilevl> |
      | ast      | <ast>      |
      | Platelet | <Platelet> |
    # details to be filled in once patient is diagnosed as Cirrotic
    Then I see text "<Message>" displayed
    And I enter the details as
      | Fields     | Value |
      | billrubin  |   100 |
      | inr        |   100 |
      | albumin    |   100 |
      | creatinine |   100 |
       And I scroll "down" the page
    And I click on "Poorly controlled"
    And I click on "Minimum"
    And I click on "variscesyes" radio option
    And I click on "bleedingyes" radio option
    And I click on "Submit Assessment"
    And I check I am on "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    # DCP-227:As a GP/Specialist, I want the ability to discard a draft  Scenario2: User selects No
    #Then I "check" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    And I check I am on "Treatment Plans" page
    And I click on "Save Draft"
    And I wait for "1000" millisecond
    And I click on "Discard Draft"
    Then I see text "Are you sure you want to Discard this Draft Treatment Plan?" displayed
    And I click on "No"
    And I check I am on "Treatment Plans" page
    # DCP-227:As a GP/Specialist, I want the ability to discard a draft  Scenario1: User selects Yes
    And I click on "Discard Draft"
    Then I see text "Are you sure you want to Discard this Draft Treatment Plan?" displayed
    And I click on "Yes"
    Then I check I am on "Treatment Options" page

    #Test16402
    Examples: 
      | PortalName | email                       | Password | FirstName      | EmailInput   | LastName           | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfourSpecilToApproveone | abwc@abc.com | PatientIsCirrhotic |    042211111 |        7 |     2222 |       40 |  50 |       20 | Complications |

  #patient name should be same as above TC (get data from above)
 
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
    And I click on "Yes"
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
      | PortalName | email                       | Password | FirstName      | EmailInput   | LastName           | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfourSpecilToApproveone | abwc@abc.com | PatientIsCirrhotic |    042211111 |        7 |     2222 |       40 |  50 |       20 | Complications |
