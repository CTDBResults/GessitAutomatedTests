@wip
Feature: some feature
#GES-736 check meddication search
Scenario Outline: Set 1..... login as gp.......create a draft (C)....... SHOULD NOT BE ABLE TO APPROVE (different popup options)....send it to specialist
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
    # Create a Patient who is Cirrhotic
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
      | searchMedicationInput | milk  |
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                  |
      | item1 | milk powder lactose free formula                                          |
      | item2 | milk protein and fat formula with vitamins and minerals carbohydrate free |
      | item3 | milk powder synthetic low calcium                                         |
      | item4 | milk powder lactose modified predigested                                  |
      | item5 | milk powder lactose free formula predigested                              |

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
    And I select "Adelaide - James Kildare (Oncologist)" from "Specialist"
    #  And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
    And I check I am on "Fibrosis Assessment" page
    And I enter the details as
      | Fields   | Value      |
      | aprilevl | <aprilevl> |
      | ast      | <ast>      |
      | Platelet | <Platelet> |
    # as part of bug  specialist should not see this message when non cirrotic.
    Then I see text "<Message>" displayed
    And I enter the details as
      | Fields     | Value |
      | billrubin  |   100 |
      | inr        |   100 |
      | albumin    |   100 |
      | creatinine |   100 |
    And I click on "Poorly controlled"
    And I scroll "down" the page
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
    And I click on "Submit"
    And I click on text "Request Referral to Liver Clinic"
    #ask arvind to change it to "approve request"
    And I click on button "sendRequestCirrhosis"
    # check that status has changed
    Then I see text "Treatment Plan (Pending Approval)" displayed
    Then "<Item>" is NOT displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Submit   |

    Examples: 
      | PortalName | email               | Password | FirstName           | EmailInput   | LastName | CU  | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demogp123@gmail.com | pass123  | CheckStatusForCPrav | abwc@abc.com | GAP      | Bay |   0422000000 |        7 |     2222 |       40 |  50 |       20 | Complications |
