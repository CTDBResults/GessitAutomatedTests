Feature: some feature

  @wip
  Scenario Outline: Login as Nurse and assign the patient to gp/specialist
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
    And I select "<CU>" from "patientCareUnit"
    And I select "Male" from "gender"
    Then I click on button "OptionalFields"
    And I enter the details as
      | Fields              | Value                 |
      | ResidentialAddress1 | <ResidentialAddress1> |
      | WeightInput         | <Weight>              |
      | Height              | <Height>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
      | Suburb              | <Suburb>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
    And I scroll "down" the page
    And I select "VIC" from "state"
    And I click on "Create Patient"
    And I click on "Next"
    And I check I am on "Medications" page
    And I click on "Next"
    And I check I am on "Diagnosis" page
    And I click on "Add HCV diagnosis"
    And I click on "Add Assessment"
    And I select "Kildare, James" from "specialist"
    And I select "Wiesel, Torsten" from "gp"
    And I click on "Next"
    And I check I am on "Medical History" page
    And I click on "Next"
    # Scenario 142/4: User navigates to next page with ALL mandatory fields filled in
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                   |
      | item1 | Validation Errors          |
      | item2 | Diabetes is mandatory      |
      | item3 | Obesity is mandatory       |
      | item4 | Hepatitis B is mandatory   |
      | item5 | Renal Failure is mandatory |
      | item6 | Contraception is mandatory |
    #Scenario 4: User navigates to next page with ALL mandatory fields filled in
    And I scroll "down" the page
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
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                           |
      | item1 | Validation Errors                                                  |
      | item2 | Likely Year of Acquisition is mandatory                            |
      | item3 | Risk factors of Acquisition - please select one or more, or select |
      | item4 | Opiod Substitution is mandatory                                    |
      | item6 | Genotype is mandatory                                              |
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
    And I enter the details as
      | Fields   | Value      |
      | aprilevl | <aprilevl> |
      | ast      | <ast>      |
      | Platelet | <Platelet> |
    And I click on "Submit Assessment" 
    Then I see text "Based on the information" displayed
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Back     |
      | item1 | Continue |
    And I click on "Continue"
    # as a nurse go upto "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    Then I "check" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"

    # Verify patient comes in nurse list
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    And I click on " My Patients"
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <FirstName> |
    And I hit Enter
    And I click on "<FirstName>"
    And I check I am on "Patient Profile" page
    Examples: 
      | PortalName | email                  | Password | FirstName         | EmailInput   | LastName    | contactInput | medicare | CU  | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   | aprilevl | ast | Platelet |
      | Gessit     | demonurse123@gmail.com | pass123  | TestNurseCreation | abwc@abc.com | SomePatient |   0422000000 |        7 | Bay |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |       12 |  12 |      200 |
