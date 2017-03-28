@Gessit_Regression
Feature: Some feature

  Scenario Outline: GES-70, GES-72
    Given I want to login to portal "<PortalName>"
    And I wait for "3000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    Then I see text "<Message>" displayed
    And I check I am on "Login" page

    #Ges-72
    Examples: 
      | PortalName | UserName       | Password | Message             |
      | Gessit     | test1@test.com | pass123  | Invalid login details. Please try again.    |
      | Gessit     |                | pass123  |Invalid login details. Please try again. |
      | Gessit     | test1@test.com |          | Invalid login details. Please try again.|


  Scenario Outline: GES-72
    Given I want to login to portal "<PortalName>"
    And I wait for "3000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Patients" page
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    Then I click on image "logout"
    And I check I am on "Logout" page
    And I wait for "1000" millisecond
    Then I click on button "loginAgain"
    And I check I am on "Login" page

    Examples: 
      | PortalName | UserName      | Password |
      | Gessit     | test@test.com | pass123  |


 
      Scenario Outline: GES-3
    #Scenario 2: Create patient without completing mandatory fields
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    Then I click on "New Patient"
    And I wait for "2000" millisecond
    And I click on "Create Patient"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                   |
      | item1 | First Name is mandatory    |
      | item2 | Last Name is mandatory     |
      | item3 | Email is mandatory         |
      | item4 | First Name is mandatory    |
      | item5 | Contact is mandatory       |
      | item6 | Gender is mandatory        |
      | item7 | Medicare No is mandatory   |
      | item8 | Date of Birth is mandatory |
    And I enter the details as
      | Fields         | Value        |
      | FirstName      | <FirstName>  |
      | EmailInput     | <EmailInput> |
      | LastNameInput  | <LastName>   |
      | medicareInput  | <medicare>   |
      | DOBInput       | <DOBInput>     |
      | postCodeInput  | <postCode>   |
      | FirstNameInput | <FirstName>  |
      | FirstNameInput | <FirstName>  |
    And I click on "Create Patient"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName             |
      | item5 | Contact is mandatory |
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
    And I click on "Create Patient"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                   |
      | item8 | Date of Birth is mandatory |

    Examples: 
      | PortalName | UserName      | Password | FirstName | EmailInput   | LastName  | contactInput | DOBInput   | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | test@test.com | pass123  | Hemantww  | abwc@abc.com | testOneww |   0422000000 | 01-01-2000 | 12121212 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |
     
  Scenario Outline: GES-3 Create patient tests (from,RHS), Postal address different from residential address
    #Scenario 1: Creation of Patient
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    Then I click on "New Patient"
    #  And I check I am on "New Patient Record" page
    And I enter the details as
      | Fields         | Value          |
      | FirstName      | <FirstName>    |
      | EmailInput     | <EmailInput>   |
      | LastNameInput  | <LastName>     |
      | contactInput   | <contactInput> |
      | DOBInput       | <DOBInput>     |
      | medicareInput  | <medicare>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I select "Male" from "Gender"
    Then I click on button "OptionalFields"
    And I enter the details as
      | Fields              | Value                 |
      | ResidentialAddress1 | <ResidentialAddress1> |
      | WeightInput         | <Weight>              |
      | Height              | <Height>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
      | Suburb              | <Suburb>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
    And I select "VIC" from "State"
    And I wait for "2000" millisecond
    And I click on "Create Patient"
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    Then I click on image "logout"
    And I click on "Login again"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <FirstName> |
    And I hit Enter
    Then I see text "<FirstName>" displayed

    #Scenario 1: Create patient
    Examples: 
      | PortalName | UserName      | Password | FirstName | EmailInput   | LastName  | contactInput | DOBInput   | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | test@test.com | pass123  | Hemantww  | abwc@abc.com | testOneww |   0422000000 | 01-01-2000 | 12121212 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  Scenario Outline: GES-3 Scenario 4 Create patient tests (from,LHS menu), Postal address different from residential address
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
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
      | DOBInput       | <DOBInput>     |
      | medicareInput  | <medicare>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I select "Male" from "Gender"
    Then I click on button "OptionalFields"
    And I enter the details as
      | Fields              | Value                 |
      | ResidentialAddress1 | <ResidentialAddress1> |
      | WeightInput         | <Weight>              |
      | Height              | <Height>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
      | Suburb              | <Suburb>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
    And I select "VIC" from "State"

    # DO not submit
    Examples: 
      | PortalName | UserName      | Password | FirstName | EmailInput   | LastName | contactInput | DOBInput   | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | test@test.com | pass123  | Test      | abwc@abc.com | Patient  |   0422000000 | 2000-01-01 | 12121212 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  

  Scenario Outline: GES-3 Create patient tests (from,RHS), Postal address different from residential address
    #Scenario 3: Create Patient Details updates header &&& Scenario 4: Create patient (menu drop down)
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    Then I click on "New Patient"
    #  And I check I am on "New Patient Record" page
    And I enter the details as
      | Fields         | Value          |
      | FirstName      | <FirstName>    |
      | EmailInput     | <EmailInput>   |
      | LastNameInput  | <LastName>     |
      | contactInput   | <contactInput> |
      | DOBInput       | <DOBInput>     |
      | medicareInput  | <medicare>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I wait for "10000" millisecond
    And I select "Male" from "Gender"
    Then I click on button "OptionalFields"
    And I enter the details as
      | Fields              | Value                 |
      | ResidentialAddress1 | <ResidentialAddress1> |
      | WeightInput         | <Weight>              |
      | Height              | <Height>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
      | Suburb              | <Suburb>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
    And I select "VIC" from "State"
    And I wait for "2000" millisecond
    And I click on "Create Patient"
    And I click on "Next"
    And I check I am on "Medications" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <FirstName> |
      | item2 | <LastName>  |

    #pending defects
    #   | item1 | <Age>   |
    # | item2 | <medicare>     |
    Examples: 
      | PortalName | UserName      | Password | FirstName | EmailInput   | LastName | contactInput | DOBInput   | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | test@test.com | pass123  | Hemant    | abwc@abc.com | testOne  |   0422000000 | 01-01-2000 | 12121212 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  Scenario Outline: GES-8 patient search
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    #Search by first name
    And I enter the details as
      | Fields          | Value  |
      | searchtextInput | maggie |
    And I hit Enter
    Then I see text "Maggie" displayed
    #Search by last name
    And I enter the details as
      | Fields          | Value   |
      | searchtextInput | simpson |
    And I hit Enter
    Then I see text "Maggie" displayed
    # Search by post code
    And I enter the details as
      | Fields          | Value |
      | searchtextInput |  3000 |
    And I hit Enter
    Then I see text "Stuart" displayed

    Examples: 
      | PortalName | UserName      | Password |
      | Gessit     | test@test.com | pass123  |

  Scenario Outline: GES-9 As a GP/Specialist, I want the ability to record the patient's medications so that the appropriate treatment plan can be selected
    #Scenario 1:Medication search unsuccessful
    #Scenario 2: User goes back
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Patients" page
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value |
      | searchtextInput | Emma |
    And I hit Enter
    And I click on "Stone"
    And I click on "Medications"
    And I wait for "1000" millisecond
    And I enter the details as
      | Fields      | Value |
      | searchMedicationInput | xxx   |
    And I hit Enter
    Then I see text "No Result Found" displayed
    Then I click on button "back"
    And I check I am on "Personal Details" page

    Examples: 
      | PortalName | UserName      | Password | FirstName | EmailInput   | LastName | contactInput | DOBInput   | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | test@test.com | pass123  | Bobby     | abwc@abc.com | Smith    |   0422000000 | 2000-01-01 | 12121212 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |
 
  Scenario Outline: GES-34 As a GP/Specialist, I want the ability to record a diagnosis against a patient's record so that the relevant assessment can be performed
    #Scenario 1: Hep C diagnosis
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
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
      #| DOBInput       | <DOBInput>     |
      | medicareInput  | <medicare>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I wait for "10000" millisecond
    And I select "Male" from "Gender"
    Then I click on button "OptionalFields"
    And I enter the details as
      | Fields              | Value                 |
      | ResidentialAddress1 | <ResidentialAddress1> |
      | WeightInput         | <Weight>              |
      | Height              | <Height>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
      | Suburb              | <Suburb>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
    And I select "VIC" from "State"
    And I wait for "2000" millisecond
    And I click on "Create Patient"
    And I click on "Next"
    And I check I am on "Medications" page
    And I click on "Next"
    And I check I am on "Diagnosis" page
    And I click on "Add HCV diagnosis"
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Victor Chang" from "Specialist"
    And I click on "Save"
    And I click on "close"
    #defect from lhs logout
    #Then I click on image "icon_menu"
    #And I wait for "1000" millisecond
    #Then I click on image "logout"
    #And I wait for "10000" millisecond
    #And I enter the details as
    #| Fields        | Value      |
    #| UserName      | <UserName> |
    #| inputPassword | <Password> |
    #And I hit Enter
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <FirstName> |
    And I hit Enter
    Then I see text "<FirstName>" displayed
    And I click on "<FirstName>"
    And I click on "Basic Information"
    And I check I am on "Basic Information" page

    Examples: 
      | PortalName | UserName      | Password | FirstName | EmailInput   | LastName | contactInput | DOBInput   | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | test@test.com | pass123  | GES-34.3  | abwc@abc.com | test     |   0422000000 | 2000-01-01 | 12121212 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  Scenario Outline: GES-351 As a GP/Specialist, I want to create an Assessment form for a diagnosis and enter a patients clinical details and intercurrent conditions
    #Scenario 1: Basically just the form check on Medical history tab
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Patients" page
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value   |
      | searchtextInput | simpson |
    And I hit Enter
    Then I see text "Maggie" displayed
    And I click on "1234"
    And I wait for "2000" millisecond
    And I click on "Medical History"
    And I check I am on "Medical History" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                           |
      | item1 | Diabetes *                         |
      | item2 | Obesity *                          |
      | item3 | Hepatitis B *                      |
      | item4 | Renal Failure (eGFR < 30mls/min) * |
      | item5 | Contraception *                    |
      | item5 | Clinical details                   |
      | item5 | Average Standard Drinks / Week     |
      | item5 | Alcohol consumption                |
      | item5 | Smoking                            |
      | item5 | Number of packs per day            |
      | item5 | Years of smoking                   |

    Examples: 
      | PortalName | UserName      | Password |
      | Gessit     | test@test.com | pass123  |

   Scenario Outline: GES-142 As a GP/Specialist, I want to create an Assessment form for a diagnosis and enter the HCV details so that I know what treatment options are applicable
    # GES-34 As a GP/Specialist, I want the ability to record a diagnosis against a patient's record so that the relevant assessment can be performed
    #Scenario 34/1: Hep C diagnosis
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
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
      | DOBInput       | <DOBInput>     |
      | medicareInput  | <medicare>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I wait for "10000" millisecond
    And I select "Male" from "Gender"
    Then I click on button "OptionalFields"
    And I enter the details as
      | Fields              | Value                 |
      | ResidentialAddress1 | <ResidentialAddress1> |
      | WeightInput         | <Weight>              |
      | Height              | <Height>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
      | Suburb              | <Suburb>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
    And I select "VIC" from "State"
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
      | Item  | ItemName |
      | item1 | HEP-C    |
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Victor Chang" from "Specialist"
    And I select "Doctor Who" from "GP"
    And I click on "Save"
    #Scenario 142/ 2: User views previous page
    And I click on "Back"
    And I check I am on "Diagnosis" page
    And I click on "Basic Information"
    And I check I am on "Basic Information" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName     |
      | item1 | Victor Chang |
      | item2 | Doctor Who   |
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
    And I click on "diabetesyes" radio option
    And I click on "obesityyes" radio option
    And I click on "hepatitisyes" radio option
    And I click on "renalfailno" radio option
    And I click on "contraceptionno" radio option
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
    And I enter the details as
      | Fields           | Value |
      | acquisitionInput |  2000 |
    And I click on "Unknown" checkbox
    And I click on "opioidyes" radio option
     And I click on "genotype1a" radio option
    And I click on "viralload6mless" radio option
    And I click on "previoustherapynaive" radio option
    And I click on "Next"
     And I check I am on "Fibrosis Assessment" page
    
 

    Examples: 
      | PortalName | UserName      | Password | FirstName | EmailInput   | LastName | contactInput | DOBInput   | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | test@test.com | pass123  | Bobby     | abwc@abc.com | Smith    |   0422000000 | 2000-01-01 | 12121212 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

      
      Scenario Outline: GES-164
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

    #Ges-164
    Examples: 
      | PortalName | UserName      | Password | FirstName  | EmailInput   | LastName              | contactInput | DOBInput   | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | test@test.com | pass123  | Test164    | abwc@abc.com | PatientIsCirrhotic    |   0422000000 | 01-01-2000 | 12121212 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |
     | Gessit     | test@test.com | pass123  | Test164    | abwc@abc.com | PatientIsNOTCirrhotic |    042211111 | 01-01-2010 |   212121 |     2222 |       40 |  50 |       20 | Complications |
    