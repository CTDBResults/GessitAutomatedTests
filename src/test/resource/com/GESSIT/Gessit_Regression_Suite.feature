@Gessit_Regression
Feature: Some feature

  Scenario Outline: GES-70, GES-72
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
    Then I see text "<Message>" displayed
    And I check I am on "Login" page

    #Ges-72
    Examples: 
      | PortalName | email          | Password | Message                                  |
      | Gessit     | test1@test.com | pass123  | Invalid login details. Please try again. |
      | Gessit     |                | pass123  | Invalid login details. Please try again. |
      | Gessit     | test1@test.com |          | Invalid login details. Please try again. |

  Scenario Outline: GES-72
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
    And I click on "New Patient"
    And I wait for "1000" millisecond
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
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    Then I click on image "logout"
    And I check I am on "Logout" page
    And I wait for "1000" millisecond
    Then I click on button "loginAgain"
    And I check I am on "Login" page

    Examples: 
      | PortalName | email                       | Password |
      | Gessit     | demospecialist123@gmail.com | pass123  |

  Scenario Outline: GES-3
    #Scenario 2: Create patient without completing mandatory fields
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
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
      | postCodeInput  | <postCode>   |
      | FirstNameInput | <FirstName>  |
      | FirstNameInput | <FirstName>  |
    And I use "DOB" to enter "12122001"
    And I click on "Create Patient"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName             |
      | item5 | Contact is mandatory |
    And I click on "Create Patient"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | item8 | Gender is mandatory |

    Examples: 
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | demospecialist123@gmail.com | pass123  | test8701  | abwc@abc.com | test     |   0422000000 |        7 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  Scenario Outline: GES-3 Create patient tests (from,RHS), Postal address different from residential address
    #Scenario 1: Creation of Patient
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
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
      | medicareInput  | <medicare>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I use "DOB" to enter "12122001"
    And I select "Royal" from "Care Unit"
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
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <FirstName> |
    And I hit Enter
    Then I see text "<FirstName>" displayed

    #Scenario 1: Create patient
    Examples: 
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName  | contactInput | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | demospecialist123@gmail.com | pass123  | Hemantww  | abwc@abc.com | testTwoww |   0422000000 |        7 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  Scenario Outline: GES-3 Scenario 4 Create patient tests (from,LHS menu), Postal address different from residential address
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
    And I wait for "5000" millisecond
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
    And I select "Royal" from "Care Unit"
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
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | demospecialist123@gmail.com | pass123  | Test      | abwc@abc.com | Patient  |   0422000000 |        7 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  Scenario Outline: GES-3 Create patient tests (from,RHS), Postal address different from residential address
    #  GES-141 :As a GP/Specialist, I want a prompt message displayed when I enter a new patient in the system and it identifies the patient already exists.
    #Scenario 1: Creation of Patient
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
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
      | medicareInput  | <medicare>     |
      | postCodeInput  | <postCode>     |
      | FirstNameInput | <FirstName>    |
      | FirstNameInput | <FirstName>    |
    And I use "DOB" to enter "12122001"
    And I select "Royal" from "Care Unit"
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
    And I wait for "1000" millisecond
    And I click on "Next"
    And I check I am on "Medications" page
    Then I click on image "icon_menu"
    And I wait for "2000" millisecond
    Then I click on image "logout"
    And I click on "Login again"
    And I wait for "1000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <FirstName> |
    And I hit Enter
    Then I see text "<FirstName>" displayed
    Then I click on "New Patient"
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
    And I select "Royal" from "Care Unit"
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

    # Then I see text "A patient already exists with the details that you have entered." displayed
    #Scenario 1: Create patient
    Examples: 
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName  | contactInput | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | demospecialist123@gmail.com | pass123  | Hemantwwf | abwc@abc.com | testTwoww |   0422000000 |        7 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  Scenario Outline: GES-9 As a GP/Specialist, I want the ability to record the patient's medications so that the appropriate treatment plan can be selected
    #Scenario 1:Medication search unsuccessful
    #Scenario 2: User goes back
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Patients" page
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value     |
      | searchtextInput | Hemantwwf |
    And I hit Enter
    And I click on "Hemantwwf"
    And I check I am on "Patient Profile" page
    And I click on "Edit Patient Details "
    And I click on "Medications"
    And I wait for "1000" millisecond
    And I enter the details as
      | Fields                | Value |
      | searchMedicationInput | xxx   |
    And I hit Enter
    Then I see text "No Result Found" displayed
    Then I click on button "back"
    And I check I am on "Personal Details" page

    Examples: 
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | demospecialist123@gmail.com | pass123  | Bobby     | abwc@abc.com | Smith    |   0422000000 |        7 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  Scenario Outline: GES-34 As a GP/Specialist, I want the ability to record a diagnosis against a patient's record so that the relevant assessment can be performed
    #Scenario 1: Hep C diagnosis
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
    And I use "DOB" to enter "12122001"
    And I wait for "10000" millisecond
    And I select "<CU>" from "Care Unit"
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
    And I select "Adelaide - James Kildare (Oncologist)" from "Specialist"
    And I click on "Save"
    And I click on "close"
    #defect from lhs logout
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    Then I click on image "logout"
    And I wait for "2000" millisecond
    And I click on "Login again"
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <FirstName> |
    And I hit Enter
    Then I see text "<FirstName>" displayed
    And I click on "<FirstName>"
    And I check I am on "Patient Profile" page
    And I click on "Edit Patient Details "
    And I click on "Basic Information"
    And I check I am on "Basic Information" page

    Examples: 
      | PortalName | email                       | Password | FirstName      |CU |EmailInput   | LastName | contactInput | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestThirtyFour |Royal|abwc@abc.com | test     |   0422000000 |        7 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  Scenario Outline: GES-8 patient search, GES-351 As a GP/Specialist, I want to create an Assessment form for a diagnosis and enter a patients clinical details and intercurrent conditions
    #Scenario 1: Basically just the form check on Medical history tab
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Patients" page
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value    |
      | searchtextInput | GES-34.4 |
    And I hit Enter
    Then I see text "test" displayed
    And I click on "GES-34.4 "
    And I check I am on "Patient Profile" page
    And I click on "Edit Patient Details "
    And I click on "Medical History"
    And I check I am on "Medical History" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item1 | Diabetes                         |
      | item2 | Obesity                          |
      | item3 | Hepatitis B                      |
      | item4 | Renal Failure (eGFR < 30mls/min) |
      | item5 | Contraception                    |
      | item5 | Clinical details                 |
      | item5 | Average Standard Drinks / Week   |
      | item5 | Alcohol consumption              |
      | item5 | Smoking                          |
      | item5 | Number of Packs / Day            |
      | item5 | Years of Smoking                 |

    Examples: 
      | PortalName | email                       | Password |
      | Gessit     | demospecialist123@gmail.com | pass123  |

  Scenario Outline: GES-142 As a GP/Specialist, I want to create an Assessment form for a diagnosis and enter the HCV details so that I know what treatment options are applicable
    # GES-34 As a GP/Specialist, I want the ability to record a diagnosis against a patient's record so that the relevant assessment can be performed
    #Scenario 34/1: Hep C diagnosis
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
      | Item  | ItemName                      |
      | item1 | Chronic Hepatitis C Infection |
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Adelaide - James Kildare (Oncologist)" from "Specialist"
    And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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

    Examples: 
      | PortalName | email                       | Password | FirstName | CU|EmailInput   | LastName | contactInput | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | demospecialist123@gmail.com | pass123  | Bobby     | Royal|abwc@abc.com | Smith    |   0422000000 |        7 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |

  #Covered in shakeout
  
  Scenario Outline: GES-164
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
    Then I click on "New Patient"
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
      | PortalName | email                       | Password | FirstName      | EmailInput   | LastName           | CU    | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demogp123@gmail.com         | pass123  | TestOnesixfour | abwc@abc.com | NOTCirrhotic       | Bay   |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfour | abwc@abc.com | NOTCirrhotic       | Royal |   0422000000 |        7 |     2222 |       40 |  50 |      200 |               |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfour | abwc@abc.com | PatientIsCirrhotic | Royal |    042211111 |        7 |     2222 |       40 |  50 |       20 | Complications |

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
    And I click on "Fibrosis/ Cirrhosis Assessment"
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
      | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfour | abwc@abc.com | PatientIsCirrhotic |    042211111 |        7 |     2222 |       40 |  50 |       20 | Complications |

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

    #Test16402
    Examples: 
      | PortalName | email                       | Password | FirstName      | EmailInput   | LastName           | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestOnesixfour | abwc@abc.com | PatientIsCirrhotic |    042211111 |        7 |     2222 |       40 |  50 |       20 | Complications |

  Scenario Outline: Check Cirrosi Logic
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
    And I select "Royal" from "Care Unit"
    And I select "Male" from "Gender"
    Then I click on button "OptionalFields"
    And I enter the details as
      | Fields              | Value                 |
      | ResidentialAddress1 | <ResidentialAddress1> |
      | WeightInput         | <Weight>              |
      | Height              | <Height>              |
      | ResidentialAddress2 | <ResidentialAddress2> |
      | Suburb              | <Suburb>              |
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
      | Item  | ItemName                      |
      | item1 | Chronic Hepatitis C Infection |
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Adelaide - James Kildare (Oncologist)" from "Specialist"
    And I select "Port Melbourne - Torsten Wiesel (GP)" from "GP"
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
    # Test2
    And I click on "Liver Biopsy" checkbox
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | item1 | Cirrhosis Diagnosed |
      | item2 | F0-F2               |
      | item2 | F3                  |
    And I click on "Imaging"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                         |
      | item1 | Splenomegaly                                                     |
      | item2 | Irregular liver contour                                          |
      | item2 | Reverse portal flow / Varices / Recanalization of umbilical vein |
    #Test 3 Fibro
    And I click on "Fibroscan" checkbox
    And I wait for "2000" millisecond
    #   Then I see text "Complications" not displayed
    Then "<Item>" is NOT displayed as "<ItemName>"
      | Item  | ItemName      |
      | item1 | Complications |
      | item1 | Billrubin     |
      | item1 | INR           |
      | item1 | Albumin       |
      | item1 | Creatinine    |
    And I enter the details as
      | Fields  | Value |
      | kpa     |    15 |
      | iqr     |    16 |
      | success |    17 |
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item1 | Complications |
      | item1 | Billrubin     |
      | item1 | INR           |
      | item1 | Albumin       |
      | item1 | Creatinine    |
    And I enter the details as
      | Fields  | Value |
      | kpa     |     1 |
      | iqr     |     2 |
      | success |     3 |
    Then "<Item>" is NOT displayed as "<ItemName>"
      | Item  | ItemName      |
      | item1 | Complications |
      | item1 | Billrubin     |
      | item1 | INR           |
      | item1 | Albumin       |
      | item1 | Creatinine    |

    Examples: 
      | PortalName | email                       | Password | FirstName           | EmailInput   | LastName     | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message1 | Suburb     | ResidentialAddress1 | Weight | Height   | ResidentialAddress2 |
      | Gessit     | demospecialist123@gmail.com | pass123  | CheckCirrhosisLogic | abwc@abc.com | NOTCirrhotic |   0422000000 |        7 |     2222 |       40 |  50 |      200 |          | Chandigarh |                  84 |    175 | Bhilowal |                     |
  
   Scenario Outline: GES-249, As a GP, I want the ability to start a treatment plan without needing to send it to a Specialist for approval and completed added as well.
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
    Then I click on button "OptionalFields"
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
      | Item  | ItemName                      |
      | item1 | Chronic Hepatitis C Infection |
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Adelaide - James Kildare (Oncologist)" from "Specialist"
    And I select "Port Melbourne - Torsten Wiesel (GP)" from "GP"
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
    # then gp completes the above plan
     And I click on "Commence medication"

      And I click on button "complete-task-button"
       Then I see text "Treatment Plan (Approved)" displayed
       Then I see sytem date displayed in "dateDiv"
        And I click on "Follow up"
        And I click on button "complete-task-button"
    Examples: 
      | PortalName | email               | Password | FirstName       | CU  | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message1      |
      | Gessit     | demogp123@gmail.com | pass123  | GPApprovedPlan | Bay | abwc@abc.com | GAP      |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |

  Scenario Outline: GES-521, As a GP/Specialist, I want to be able to view a task on a draft treatment plan in both a simplified and detailed view
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
      | Item  | ItemName                      |
      | item1 | Chronic Hepatitis C Infection |
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Adelaide - James Kildare (Oncologist)" from "Specialist"
    #And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
    And I click on "Save Draft"
    Then I see text "Treatment Plan (Draft)" displayed

    Examples: 
      | PortalName | email               | Password | FirstName         | EmailInput   | LastName | contactInput | medicare | postCode | CU  | aprilevl | ast | Platelet | Message1      | Suburb|ResidentialAddress1 | Weight | Height | ResidentialAddress2 |
      | Gessit     | demogp123@gmail.com | pass123  | TestFiveTwentyOnetaketwo | abwc@abc.com | GAP      |   0422000000 |        7 |     2222 | Bay |       40 |  50 |      200 | Non-Cirrhotic | Chandigarh|Chandigarh          |     78 |    175 | bheelowal           |





  Scenario Outline: GES-521, As a GP/Specialist, I want to be able to view a task on a draft treatment plan in both a simplified and detailed view
    Given I want to login to portal "<PortalName>"
    And I wait for "8000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Patients" page
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <FirstName> |
    And I hit Enter
    And I click on "<FirstName>"
    And I check I am on "Patient Profile" page
    And I click on "Edit Patient Details "
    And I wait for "2000" millisecond
    And I click on "Treatment Plans"
    # check detailed view
    Then I "check" text "Baseline bloods" displayed in table "treatmentplantable"
    #Check Simplified view
    #And I wait for "2000" millisecond
    Then I "click" text "Baseline bloods" displayed in table "treatmentplantable"
    And I wait for "2000" millisecond
    Then I see text "FBE, urea and electrolytes, LFTs, HCV RNA level (quantitative)" displayed

    #****************first name should be same as above example**************************
    Examples: 
      | PortalName | email               | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message1      |
      | Gessit     | demogp123@gmail.com | pass123  | TestFiveTwentyOnetaketwo  | abwc@abc.com | GAP      |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |

  @current_defect
  Scenario Outline: GES-521, As a GP/Specialist, I want to be able to view a task on a draft treatment plan in both a simplified and detailed view
    Given I want to login to portal "<PortalName>"
    And I wait for "8000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I check I am on "My Patients" page
    Then I see the table "myPatientsTable" displayed
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <FirstName> |
    And I hit Enter
    And I click on "<FirstName>"
    And I check I am on "Patient Profile" page
    And I click on "Edit Patient Details "
    And I wait for "2000" millisecond
    And I click on "Treatment Plans"
    # check detailed view
    Then I "check" text "Specialist consultation" displayed in table "treatmentplantable"
    #Check Simplified view
    Then I "click" text "Specialist consultation" displayed in table "treatmentplantable"
    Then I see text "Specialist consultation" displayed

    Examples: 
      | PortalName | email               | Password | FirstName       | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message1      |
      | Gessit     | demogp123@gmail.com | pass123  | GPApprovedPlan2 | abwc@abc.com | GAP      |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic |

  Scenario Outline: GES-499, As a Specialist, I want the ability to approve a draft treatment plan that I have created
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
    And I select "Adelaide - James Kildare (Oncologist)" from "Specialist"
    And I wait for "2000" millisecond
    And I select "Port Melbourne - Torsten Wiesel (GP)" from "GP"
    And I click on "Save"
    #Scenario 142/ 2: User views previous page
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
    And I click on "Submit Assessment"
    And I check I am on "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    # to ensure TP are in status new
    Then I see text "Treatment Plan (New)" displayed
    And I click on "Submit"
    Then I see text "Are you sure you want to approve and initiate this treatment plan?" displayed
    And I click on "Approve Plan"
    Then I see text "Treatment Plan (Approved)" displayed

    # Todo ....add bug 808 task verification
    Examples: 
      | PortalName | email                       | Password | FirstName        | CU    | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message1      | Suburb     | ResidentialAddress1 | Weight | Height | ResidentialAddress2 |
      | Gessit     | demospecialist123@gmail.com | pass123  | TestFourNineNine | Royal | abwc@abc.com | GAP      |   0422000000 |        7 |     2222 |       40 |  50 |      200 | Non-Cirrhotic | Chandigarh | Chandigarh          |     78 |    175 | bheelowal           |

  #***********************************************************************************************************************
  #***********************************************************************************************************************
  #***********************************************************************************************************************
  #***********************************************************************************************************************
  #****************************************END TO END *********************************************************************
  #***********************************************************************************************************************
  #***********************************************************************************************************************
  #***********************************************************************************************************************
  #***********************************************************************************************************************
Scenario Outline: Set 1..... login as gp.......create a draft (NC)....... approve
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
    And I click on "Save Draft"
    And I wait for "1000" millisecond
    Then I see text "Treatment Plan (Draft)" displayed
    Then I click on "Submit"
    And I click on text "Approve Treatment Plan as a GP"
    And I click on button "sendRequestNonCirrhosis"
    Then I see text "Treatment Plan (Approved)" displayed

    Examples: 
      | PortalName | email               | Password | FirstName | EmailInput   | LastName | CU|contactInput | medicare | postCode | aprilevl | ast | Platelet | Message |
      | Gessit     | demogp123@gmail.com | pass123  | EtoESetTwo    | abwc@abc.com | GAP      | Bay|  0422000000 |        7 |     2222 |       40 |  50 |      200 |         |
#################################################### E2E Set2 #####################################################
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
    Then I click on "New Patient"
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
      | PortalName | email               | Password | FirstName             | EmailInput   | LastName |CU |contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demogp123@gmail.com | pass123  | CheckStatusForCPrav | abwc@abc.com | GAP      | Bay | 0422000000 |        7 |     2222 |       40 |  50 |       20 | Complications |



########################################### Set 3 E2E#########################################

 
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
    And I select "Royal" from "Care Unit"
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
    And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
      | PortalName | email               | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message |
      | Gessit     | demogp123@gmail.com | pass123  | SetTwo    | abwc@abc.com | GAP      |   0422000000 |        7 |     2222 |       40 |  50 |      200 |         |

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
    And I select "Royal" from "Care Unit"
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
    And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message |
      | Gessit     | demospecialist123@gmail.com | pass123  | SetTwo    | abwc@abc.com | GAP      |   0422000000 |        7 |     2222 |       40 |  50 |      200 |         |

  Scenario Outline: Set 7..... login as specialist.......create a draft (C).......save and  approve
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
    And I select "Royal" from "Care Unit"
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
    And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
    And I enter the details as
      | Fields     | Value |
      | billrubin  |   100 |
      | inr        |   100 |
      | albumin    |   100 |
      | creatinine |   100 |
    And I click on "Poorly controlled"
    And I click on "Minimum"
    And I click on "variscesyes" radio option
    And I click on "bleedingyes" radio option
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
    Then I see the table "treatmentplantable" displayed
    Then I see text "0 days" displayed
    Then I see text "Commence medication" displayed
    And I click on "Commence medication"
    And I see popup "viewTaskModal" displayed
    #    Scenario Outline:GES-226 As a GP/Specialist, I want the ability to edit treatment tasks on an approved treatment plan
    #    GES-226 - Scenario 1: Edit button (pre-commencement)
    And I click on "edit-task-button" on popup
    And I see popup "editTreatmentTaskModal" displayed
    And I enter the details as
      | Fields          | Value |
      | editTaskDueDays |   786 |
    And I click on "saveEditTask" on popup
    Then I see text "786 days" displayed
    #  GES-226  Scenario 2: Edit button (post-commencement)
    And I click on "Commence medication"
    And I see popup "viewTaskModal" displayed
    And I click on "complete-task-button" on popup
    Then I see sytem date displayed in "dateDiv"

    Examples: 
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demospecialist123@gmail.com | pass123  | SetTwo    | abwc@abc.com | GAP      |   0422000000 |        7 |     2222 |       40 |  50 |       20 | Complications |

  Scenario Outline: 
    # Set 8..... login as specialist.......create a draft (C).......save and  discard
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
    And I select "Royal" from "Care Unit"
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
    And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
    And I enter the details as
      | Fields     | Value |
      | billrubin  |   100 |
      | inr        |   100 |
      | albumin    |   100 |
      | creatinine |   100 |
    And I click on "Poorly controlled"
    And I click on "Minimum"
    And I click on "variscesyes" radio option
    And I click on "bleedingyes" radio option
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
    And I click on "Discard Draft"
    And I click on text "Are you sure you want to Discard this Draft Treatment Plan?"
    And I click on "Yes"
    And I check I am on "Treatment Options" page

    #defect 824
    #Then I see text "Treatment Plans" not displayed
    Examples: 
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demospecialist123@gmail.com | pass123  | SetTwo    | abwc@abc.com | GAP      |   0422000000 |        7 |     2222 |       40 |  50 |       20 | Complications |

  Scenario Outline: GES-119, GES-621 As an Administrator, I want the ability to create and view Care Units
    # Scenario 1: Administrator accesses Create Care Unit function
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    And I click on "Care Units"
    And I wait for "1000" millisecond
    And I click on "New Care Unit"
    And I click on "Submit"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                    |
      | item1 | State is mandatory          |
      | item2 | Care Unit Name is mandatory |
      | item3 | Address Line 1 is mandatory |
      | item1 | Postcode is mandatory       |
      | item2 | Contact number is mandatory |
      | item3 | Email address is mandatory  |
      | item3 | Suburb is mandatory         |
    Then I see text "Add New Care Unit" displayed
    And I enter the details as
      | Fields        | Value               |
      | name          | <CareUnitNameValue> |
      | contactEmail  | adb@ads             |
      | address_1     | <Address Line 1>    |
      | contactNumber | <Contact Number>    |
      | postcode      | <Postcode>          |
      | suburb        | <Suburb>            |
    And I click on "Submit"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item1 | Email address is not in a valid format |
    And I enter the details as
      | Fields        | Value               |
      | name          | <CareUnitNameValue> |
      | contactEmail  | <Contact Email>     |
      | address_1     | <Address Line 1>    |
      | contactNumber | <Contact Number>    |
      | postcode      | <Postcode>          |
      | suburb        | <Suburb>            |
    And I click on "Select"
    And on popup I select "VIC" from "state"
    And I hit Enter
    And I wait for "2000" millisecond
    And I click on "Submit"
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    Then I click on image "logout"
    And I check I am on "Logout" page
    And I wait for "1000" millisecond
    Then I click on button "loginAgain"
    And I wait for "1000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    And I click on "Care Units"
    And I wait for "1000" millisecond
    And I click on "New Care Unit"
    And I enter the details as
      | Fields        | Value               |
      | name          | <CareUnitNameValue> |
      | contactEmail  | <Contact Email>     |
      | address_1     | <Address Line 1>    |
      | contactNumber | <Contact Number>    |
      | postcode      | <Postcode>          |
      | suburb        | <Suburb>            |
    And I click on "Select"
    And on popup I select "VIC" from "state"
    And I click on "Submit"
    Then I see text "Care Unit already exist" displayed

    Examples: 
      | PortalName | email                       | Password | CareUnitNameValue | Postcode | Address Line 1 | Contact Number | Contact Email | Suburb    |
      | Gessit     | demospecialist123@gmail.com | pass123  | Test119and621     |     3000 | 13 Kona St     |       99880099 | test@test.com | Melbourne |

  ##############################################################
  #######################NOTES BY GP AND SP#########################
  ###############################################################
  Scenario Outline: GES-233 - As a GP/Specialist, I should be able to add notes to a treatment plan page
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
    And I select "Royal" from "Care Unit"
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
    And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
    And I click on "Save Draft"
    And I wait for "1000" millisecond
    Then I see text "Treatment Plan (Draft)" displayed
    # Add notes
    And I click on text "+ Add Note"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Title *  |
      | item1 | Note *   |
    And I enter the details as
      | Fields    | Value       |
      | addnote   | <addnote>   |
      | noteinput | <noteinput> |
    And I click on button "saveNote"
    And I check I am on "Treatment Plans" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <addnote>   |
      | item1 | <noteinput> |
    Then I click on "Submit"
    And I click on text "Approve Treatment Plan as a GP"
    And I click on button "sendRequestNonCirrhosis"
    Then I see text "Treatment Plan (Approved)" displayed
    # GES-172 As a GP/Specialist, I want the ability to add treatment tasks to an approved treatment plan
    And I click on text "+ Add Note"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Title *  |
      | item1 | Note *   |
    And I enter the details as
      | Fields    | Value        |
      | addnote   | <addnote2>   |
      | noteinput | <noteinput2> |
    And I click on button "saveNote"
    And I check I am on "Treatment Plans" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <addnote>   |
      | item1 | <noteinput> |

    Examples: 
      | PortalName | email               | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message | text                     | addnote   | noteinput     | addnote2 | noteinput2                     | billrubin | inr | albumin | creatinine | Poorly controlled | Minimum | variscesyes | bleedingyes |
      | Gessit     | demogp123@gmail.com | pass123  | test233   | abwc@abc.com | GPNC     |   0422000000 |        7 |     2222 |       40 |  50 |      200 |         | Based on the information | I am a GP | entering note | GP       | Check if i can add to approved |           |     |         |            |                   |         |             |             |

  Scenario Outline: GES-233 - As a GP, I should be able to add notes to a Cirrotic treatment plan page
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
    And I select "Royal" from "Care Unit"
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
    And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
    # details to be filled in once patient is diagnosed as Cirrotic
    Then I see text "<Message>" displayed
    And I enter the details as
      | Fields     | Value |
      | billrubin  |   100 |
      | inr        |   100 |
      | albumin    |   100 |
      | creatinine |   100 |
    And I click on "Poorly controlled"
    And I click on "Minimum"
    And I click on "variscesyes" radio option
    And I click on "bleedingyes" radio option
    And I click on "Submit Assessment"
    Then I see text "<text>" displayed
    And I check I am on "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    Then I see text "Treatment Plan (New)" displayed
    And I click on "Save Draft"
    And I wait for "1000" millisecond
    Then I see text "Treatment Plan (Draft)" displayed
    # Add notes
    And I click on text "+ Add Note"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Title *  |
      | item1 | Note *   |
    And I enter the details as
      | Fields    | Value       |
      | addnote   | <addnote>   |
      | noteinput | <noteinput> |
    And I click on button "saveNote"
    And I check I am on "Treatment Plans" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <addnote>   |
      | item1 | <noteinput> |
    Then I click on "Submit"
    And I click on button "sendRequestCirrhosis"
    Then I see text "Treatment Plan (Pending Approval)" displayed
    And I click on text "+ Add Note"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Title *  |
      | item1 | Note *   |
    And I enter the details as
      | Fields    | Value        |
      | addnote   | <addnote2>   |
      | noteinput | <noteinput2> |
    And I click on button "saveNote"
    And I check I am on "Treatment Plans" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <addnote>   |
      | item1 | <noteinput> |

    Examples: 
      | PortalName | email               | Password | FirstName | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message | text | addnote   | noteinput     | addnote2 | noteinput2                     |
      | Gessit     | demogp123@gmail.com | pass123  | test233   | abwc@abc.com | GPC      |   0422000000 |        7 |     2222 |       40 |  50 |       20 |         |      | I am a GP | entering note | GP       | Check if i can add to approved |

  Scenario Outline: GES-233 - As a GP, I should be able to add notes to a Cirrotic treatment plan page
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
    And I select "Royal" from "Care Unit"
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
    And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
    # details to be filled in once patient is diagnosed as Cirrotic
    Then I see text "<Message>" displayed
    And I enter the details as
      | Fields     | Value |
      | billrubin  |   100 |
      | inr        |   100 |
      | albumin    |   100 |
      | creatinine |   100 |
    And I click on "Poorly controlled"
    And I click on "Minimum"
    And I click on "variscesyes" radio option
    And I click on "bleedingyes" radio option
    And I click on "Submit Assessment"
    Then I see text "<text>" displayed
    And I check I am on "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    Then I see text "Treatment Plan (New)" displayed
    And I click on "Save Draft"
    And I wait for "1000" millisecond
    Then I see text "Treatment Plan (Draft)" displayed
    # Add notes
    And I click on text "+ Add Note"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Title *  |
      | item1 | Note *   |
    And I enter the details as
      | Fields    | Value       |
      | addnote   | <addnote>   |
      | noteinput | <noteinput> |
    And I click on button "saveNote"
    And I check I am on "Treatment Plans" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <addnote>   |
      | item1 | <noteinput> |
    Then I click on "Submit"
    And I click on text "Approve Plan"
    Then I see text "Treatment Plan (Approved)" displayed
    And I click on text "+ Add Note"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Title *  |
      | item1 | Note *   |
    And I enter the details as
      | Fields    | Value        |
      | addnote   | <addnote2>   |
      | noteinput | <noteinput2> |
    And I click on button "saveNote"
    And I check I am on "Treatment Plans" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <addnote>   |
      | item1 | <noteinput> |

    Examples: 
      | PortalName | email                       | Password | FirstName              | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message | text | addnote   | noteinput     | addnote2   | noteinput2                              |
      | Gessit     | demospecialist123@gmail.com | pass123  | test233loginSpecialist | abwc@abc.com | SPC      |   0422000000 |        7 |     2222 |       40 |  50 |       20 |         |      | I am a GP | entering note | SPecialist | Check if specialist can add to approved |

  Scenario Outline: GES-233 - As a GP, I should be able to add notes to a Cirrotic treatment plan page
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
    And I select "Royal" from "Care Unit"
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
    And I select "Darwin - Torsten Wiesel (GP)" from "GP"
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
    # details to be filled in once patient is diagnosed as Cirrotic
    Then I see text "<Message>" displayed
    And I enter the details as
      | Fields     | Value |
      | billrubin  |   100 |
      | inr        |   100 |
      | albumin    |   100 |
      | creatinine |   100 |
    And I click on "Poorly controlled"
    And I click on "Minimum"
    And I click on "variscesyes" radio option
    And I click on "bleedingyes" radio option
    And I click on "Submit Assessment"
    Then I see text "<text>" displayed
    And I check I am on "Treatment Options" page
    Then I see the table "treatmentoptiontable" displayed
    Then I "check" text "Elbasvir + Grazoprevir" displayed in table "treatmentoptiontable"
    Then I "click" text "Paritaprevir/ RTV + Ombitasvir + Dasabuvir + Ribavirin" displayed in table "treatmentoptiontable"
    And I click on "Select Treatment"
    Then I see text "Treatment Plan (New)" displayed
    And I click on "Save Draft"
    And I wait for "1000" millisecond
    Then I see text "Treatment Plan (Draft)" displayed
    # Add notes
    And I click on text "+ Add Note"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Title *  |
      | item1 | Note *   |
    And I enter the details as
      | Fields    | Value       |
      | addnote   | <addnote>   |
      | noteinput | <noteinput> |
    And I click on button "saveNote"
    And I check I am on "Treatment Plans" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <addnote>   |
      | item1 | <noteinput> |
    Then I click on "Submit"
    And I click on text "Approve Plan"
    Then I see text "Treatment Plan (Approved)" displayed
    And I click on text "+ Add Note"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Title *  |
      | item1 | Note *   |
    And I enter the details as
      | Fields    | Value        |
      | addnote   | <addnote2>   |
      | noteinput | <noteinput2> |
    And I click on button "saveNote"
    And I check I am on "Treatment Plans" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <addnote>   |
      | item1 | <noteinput> |

    Examples: 
      | PortalName | email                       | Password | FirstName              | EmailInput   | LastName | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message | text | addnote   | noteinput     | addnote2   | noteinput2                              |
      | Gessit     | demospecialist123@gmail.com | pass123  | test233loginSpecialist | abwc@abc.com | SPC      |   0422000000 |        7 |     2222 |       40 |  50 |       20 |         |      | I am a GP | entering note | SPecialist | Check if specialist can add to approved |

  Scenario Outline: GES-502 Password reset for an account
    Given I want to login to portal "<PortalName>"
    And I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I click on "Forgot Password?"
    And I check I am on "Forgot Password" page
    And I wait for "2000" millisecond
    And I click on button "buttonSubmit"
    #Scenario 1 Mandatory field not filled in
    Then I see text "<Message>" displayed
    #Scenario 2: Email does not exist
    And I enter the details as
      | Fields | Value           |
      | email  | <invalid email> |
    And I click on button "buttonSubmit"
    Then I see text "<Message2>" displayed

    Examples: 
      | PortalName | Message                 | invalid email         | Message2                |
      | Gessit     | field must be filled in | invalidemail@test.com | ReCaptcha must be done. |

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

    # Test16402
    Examples: 
      | PortalName | email                       | Password | FirstName | EmailInput   | LastName           | contactInput | medicare | postCode | aprilevl | ast | Platelet | Message       |
      | Gessit     | demospecialist123@gmail.com | pass123  | pass123   | abwc@abc.com | PatientIsCirrhotic |    042211111 |        7 |     2222 |       40 |  50 |       20 | Complications |
