Feature: some feature


  
  
  
       ######################## START ###############################
      Scenario Outline: GES1124 - As a GP/Specialist, I should be able to add notes to a treatment plan page
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
    And I wait for "1000" millisecond
    And I use "DOB" to enter "12122001"
    And I select "<CU>" from "patientCareUnit"
    And I select "Male" from "gender"
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
    And I select "Kildare, James" from "specialist"
    # And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
    And I click on "Submit Assessment"
    Then I see text "<text>" displayed
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
 Then I click on "Submit"
 And I see popup "modal-body-next" displayed
 # And I click on text "Request Referral to Liver Clinic"
  And I click on text "Request Specialist participation in"
    And I click on button "sendRequestNonCirrhosis"
    # check that status has changed
    Then I see text "Treatment Plan (Pending Approval)" displayed
    Then "<Item>" is NOT displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Submit   |

    Examples: 
      | PortalName | email               | Password | FirstName               | EmailInput   | LastName   | contactInput | CU  | medicare | postCode | aprilevl | ast | Platelet | Message | text                     | addnote   | noteinput     | addnote2              | noteinput2                     | billrubin | inr | albumin | creatinine | Poorly controlled | Minimum | variscesyes | bleedingyes |
      | Gessit     | demogp123@gmail.com | pass123  | sendToSpecialist | abwc@abc.com | with parameters |   0422000000 | Bay |        7 |     2222 |       40 |  50 |      200 |         | Based on the information | I am a GP | entering note | GP, the first contact | Check if i can add to approved |           |     |         |            |                   |         |             |             |

  

   Scenario Outline: GES1124 - As a GP/Specialist, I should be able to add notes to a treatment plan page
    # ********* continue from above...Specialist pick up above patient and cancel it********
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
    Then I see text "<LastName>" displayed
    And I click on "<LastName>"
        And I click on "Edit Patient Details "
    And I click on "Treatment Plans"
    Then I see text "Treatment Plan (Pending Approval)" displayed
        # stupid sys....cancel marked as saveButton
    And I click on button "saveButton"
   And I wait for "1000" millisecond
    Then I see text "Treatment Plan (Cancelled)" displayed
  
    Examples: 
      | PortalName | email               | Password | FirstName               | EmailInput   | LastName   | contactInput | CU  | medicare | postCode | aprilevl | ast | Platelet | Message | text                     | addnote   | noteinput     | addnote2              | noteinput2                     | billrubin | inr | albumin | creatinine | Poorly controlled | Minimum | variscesyes | bleedingyes |
      | Gessit     | demospecialist123@gmail.com | pass123  | sendToSpecialist | abwc@abc.com | with parameters |   0422000000 | Bay |        7 |     2222 |       40 |  50 |      200 |         | Based on the information | I am a GP | entering note | GP, the first contact | Check if i can add to approved |           |     |         |            |                   |         |             |             |
      
      
        Scenario Outline: GES1124 - As a GP/Specialist, I should be able to add notes to a treatment plan page
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Tasks" page
        And I check I am on "My Patients" page
    And I check my "inbox"
     Then I see text "Treatment Plan Cancelled" displayed
    
    
    Examples: 
      | PortalName | email               | Password | FirstName               | EmailInput   | LastName   | contactInput | CU  | medicare | postCode | aprilevl | ast | Platelet | Message | text                     | addnote   | noteinput     | addnote2              | noteinput2                     | billrubin | inr | albumin | creatinine | Poorly controlled | Minimum | variscesyes | bleedingyes |
      | Gessit     | demogp123@gmail.com | pass123  | sendToSpecialist | abwc@abc.com | with parameters |   0422000000 | Bay |        7 |     2222 |       40 |  50 |      200 |         | Based on the information | I am a GP | entering note | GP, the first contact | Check if i can add to approved |           |     |         |            |                   |         |             |             |
    
      ######################### END ##############################
            
            
            