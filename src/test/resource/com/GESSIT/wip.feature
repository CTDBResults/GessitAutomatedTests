Feature: wip

  @wip
  Scenario Outline: GES-167
  #Scenario 1: Treatment option displayed 
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    # Create a Patient who is Cirrhotic
    Then I click on "New Patient"
    And I enter the details as
      | Fields         | Value          |
      | FirstName      | <FirstName>    |
      | EmailInput     | <EmailInput>   |
      | LastNameInput  | <LastName>     |
      | contactInput   | <contactInput> |
      | medicareInput  | <medicare>     |
      | DOB            | <DOBInput>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I select "Male" from "Gender"
    And I click on "Create Patient"
    And I check I am on "Personal Details" page
    Then I click on "Next"
    And I check I am on "Medications" page
    And I enter the details as
      | Fields                | Value |
      | searchMedicationInput | sova  |
    And I hit Enter
    Then I click on "Add"
    And I enter the details as
      | Fields    | Value       |
      | frequency | twice a day |
    Then I click on "Add Medication"
    And I wait for "10000" millisecond
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
    And I click on "renalfailno" radio option
    And I click on "contraceptionno" radio option
    And I click on "hivno" radio option
    And I click on "Next"
    And I check I am on "Current Medications" page
    And I click on "Next"
    And I check I am on "HepC History" page
    And I click on "genotype2" radio option
    And I enter the details as
      | Fields           | Value |
      | acquisitionInput |  2000 |
    And I click on "Unknown" checkbox
    And I click on "opioidyes" radio option
    And I click on "genotype1a" radio option
    And I click on "viralload6mless" radio option
    And I click on "previoustherapynaive" radio option
    And I click on "previoustherapynaive" radio option
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
    # 40, 50, 200 will trigger yes and 40,50,20 will trigger No
    And I check I am on "Fibrosis Assessment" page
    And I enter the details as
      | Fields   | Value      |
      | aprilevl | <aprilevl> |
      | ast      | <ast>     |
      | Platelet | <Platelet> |
    Then I see text "<Message>" displayed

    #Ges-72
    Examples: 
      | PortalName | UserName      | Password | FirstName  | EmailInput   | LastName              | contactInput | DOBInput   | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | test@test.com | pass123  | Test164    | abwc@abc.com | PatientIsCirrhotic    |   0422000000 | 01-01-2000 | 12121212 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |
     | Gessit     | test@test.com | pass123  | Test164    | abwc@abc.com | PatientIsNOTCirrhotic |    042211111 | 01-01-2010 |   212121 |     2222 |       40 |  50 |       20 | Complications |
    