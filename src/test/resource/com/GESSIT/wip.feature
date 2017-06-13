
Feature: some feature


  Scenario Outline: GES-997, GP/Specialist creates a TP, Nurse should be able to COMMENCE Medication
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
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
    And I wait for "1000" millisecond
    And I use "DOB" to enter "12122001"
    And I select "<CU>" from "patientCareUnit"
    And I select "Male" from "gender"
    Then I click on button "OptionalFields"
    And I scroll "down" the page
    And I select "VIC" from "state"
    And I wait for "2000" millisecond
    And I click on "Create Patient"
    And I click on "Next"
    And I check I am on "Medications" page
    And I click on "Next"
    And I check I am on "Diagnosis" page
    And I click on "Add HCV diagnosis"
    #Scenario 142/ 1: User views previous page
    And I click on "Back"
    And I check I am on "Medications" page
    And I click on "Next"
    And I check I am on "Diagnosis" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                      |
      | item1 | Chronic Hepatitis C Infection |
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Kildare, James" from "specialist"
    And I click on "Save"
    #Scenario 142/ 2: User views previous page
    And I click on "Back"
    And I check I am on "Diagnosis" page
    And I click on "Basic Information"
    And I check I am on "Basic Information" page
    And I click on "Next"
    And I check I am on "Medical History" page
    #  And I wait for "2000" millisecond
    #Scenario 4: User navigates to next page with ALL mandatory fields filled in
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
    #Scenario 5 Navigating to F/C History page
    And I click on "genotype2" radio option
    And I select "2015" from "acquisitionInput"
    And I click on "Tattoos" checkbox
    And I click on "opioidyes" radio option
    And I click on "genotype1a" radio option
    And I click on "viralload6mless" radio option
    And I click on "previoustherapyno" radio option
    And I click on "Next"
    And I check I am on "Fibrosis Assessment" page
    # Test1
    And I enter the details as
      | Fields   | Value      |
      | aprilevl | <aprilevl> |
      | ast      | <ast>      |
      | Platelet | <Platelet> |
    Then I see text "<Message1>" displayed
    And I click on "Submit Assessment"
    And I click on "Continue"
    And I check I am on "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    # to ensure TP are in status new
    Then I see text "Treatment Plan (New)" displayed
    And I click on "Submit"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                            |
      | item1 | Request Specialist Approval         |
      | item1 | Approve Treatment Plan as a GP      |
      | item1 | Request Referral to Liver Clinic    |
      | item1 | Request Specialist participation in |
    And I click on text "Approve Treatment Plan as a GP"
    #ask arvind to change it to "approve request"
    And I click on button "sendRequestNonCirrhosis"
    And I wait for "2000" millisecond
    Then I see text "Treatment Plan (Approved)" displayed
    # then gp completes the above plan, GES-87 covered partially here
    #Ges-997
    And I click on "Commence medication"
    And I see popup "modal-content" displayed

    Examples: 
      | PortalName | email               | Password | FirstName               | CU  | EmailInput   | LastName  | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message1      |
      | Gessit     | demogp123@gmail.com | pass123  | NurseCommenceMedication | Bay | abwc@abc.com | GAPprodtt |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |
 
  Scenario Outline: GES-997-2, GP/Specialist creates a TP, Nurse should be able to COMMENCE Medication
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
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
    And I check I am on "Patient Profile" page
    And I click on "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin 12weeks"
    # checking that nurse should be able to perform the following
      And I click on "Commence medication"
    And I see popup "modal-content" displayed
    And I click on button "complete-commence-task-button"
    # newly introduced popup
    And I see popup "modal-dialog modal-md" displayed
    And I click on button "commence-med-yes"
    Then I see text "Treatment Plan (Approved)" displayed
    Then I see sytem date displayed in "dateDiv"
    And I scroll "down" the page
    And I click on "Follow up"
    And I click on button "complete-task-button"

    Examples: 
      | PortalName | email               | Password | FirstName               | CU  | EmailInput   | LastName  | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message1      |
      | Gessit     | demonurse123@gmail.com | pass123  | NurseCommenceMedication | Bay | abwc@abc.com | GAPprodtt |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |

        
       Scenario Outline: GES-937-2, Using above two scenarios- specialist will cancel the TP and check if GP gets notified
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
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
    And I check I am on "Patient Profile" page
    And I click on "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin 12weeks"
    # checking that nurse should be able to perform the following
    And I wait for "1000" millisecond
    # stupid sys....cancel marked as saveButton
    And I click on button "saveButton"
    #Then I see text "Cancel Plan (Early Termination of Plan)" displayed
    And I see popup "modal-body-next" displayed
    # And I click on "Cancel Plan" on popup
    And I click on button "sendRequestArchive"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                          |
      | item1 | RNA Detected is mandatory                         |
      | item1 | Reason for early termination of plan is mandatory |
    And I wait for "1000" millisecond
    And I click on "Lost to Follow-up" checkbox
    And I click on "RNADetectedYes" radio option
    And I click on button "sendRequestArchive"
    And I wait for "1000" millisecond
    Then I see text "Treatment Plan (Cancelled)" displayed

    Examples: 
      | PortalName | email               | Password | FirstName               | CU  | EmailInput   | LastName  | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message1      |
      | Gessit     | demospecialist123@gmail.com | pass123  | NurseCommenceMedication | Bay | abwc@abc.com | GAPprodtt |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |
      
         @wip
       Scenario Outline: GES-937-2, Using above two scenarios- specialist will cancel the TP and check if GP gets notified
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Tasks" page
    Then I click on image "icon_menu"
    And I wait for "10000" millisecond
    And I click on " My Patients"
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value      |
      | searchtextInput | <LastName> |
    And I hit Enter
    And I check I am on "My Patients" page
    And I check my "inbox"
     Then I see text "Treatment Plan Cancelled" displayed
    Examples: 
      | PortalName | email               | Password | FirstName               | CU  | EmailInput   | LastName  | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message1      |
      | Gessit     | demogp123@gmail.com | pass123  | NurseCommenceMedication | Bay | abwc@abc.com | GAPprodtt |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |
      