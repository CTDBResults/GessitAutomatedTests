Feature: wip

  @algo
  Scenario Outline: Test algorithm via UI
    Given I want to login to portal "Gessit"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value                       |
      | email         | demospecialist123@gmail.com |
      | inputPassword | pass123                     |
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
      | Fields         | Value             |
      | FirstName      | testAlgo          |
      | EmailInput     | testalgo@algo.com |
      | LastNameInput  | algo              |
      | contactInput   |            111111 |
      | medicareInput  |                 7 |
      | postCodeInput  |              1111 |
      | FirstNameInput | test              |
      | FirstNameInput | algo              |
    And I use "DOB" to enter "12122001"
    And I select "Royal" from "Care Unit"
    And I select "Male" from "Gender"
    #Then I click on button "OptionalFields"
    #And I enter the details as
      #| Fields              | Value |
      #| ResidentialAddress1 | some  |
      #| WeightInput         |    23 |
      #| Height              |   160 |
      #| ResidentialAddress2 | xxx   |
      #| Suburb              | sss   |
      #| ResidentialAddress2 | rrr   |
    #And I select "VIC" from "State"
    #And I wait for "2000" millisecond
    And I click on "Create Patient"
    And I click on "Next"
    And I check I am on "Medications" page
    And I click on "Next"
    And I check I am on "Diagnosis" page
    And I click on "Add HCV diagnosis"
    And I click on "Add Assessment"
    And I check I am on "Basic Information" page
    And I select "Port Melbourne - Torsten Wiesel (GP)" from "GP"
    And I click on "Next"
    Then I check I am on "Medical History" page
    And I click on "diabetesyes" radio option
    And I click on "obesityyes" radio option
    And I click on "hepatitisyes" radio option
    And for ALGO I click on "<Renal>" radio option
    And I click on "contraceptionno" radio option
    And I click on "hivno" radio option
    And I click on "Next"
    And I click on "Next"
    And I check I am on "HepC History" page
    ###
    And I select "2015" from "acquisitionInput"
    And I click on "Tattoos" checkbox
    And I click on "opioidyes" radio option

    And for ALGO I click on "<GenoType>" radio option

    And for ALGO I select on "<PreviousTherapy>","<TreatmentExperiance>" and "<Outcome>" radio option
    And I click on "Next"
    And I check I am on "Fibrosis Assessment" page
    And I wait for "1000" millisecond
    And for ALGO I select "<Fibrosis>"
    And I click on "Submit Assessment"

    Examples: 

      | PortalName | email               | Password | GenoType | Fibrosis | PreviousTherapy | TreatmentExperiance | Outcome | Renal | Result | Expected UI Value |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | NC       | NVX             |                     |         | G30   |        | HEPC1             |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       | NVX             |                     |         | L30   |        | HEPC9 HEPC14      |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       |                 | X5B                 | XIN     | G30   |        | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | NC       |                 | XPN                 |  XIN       | G30   | HEPC1  | HEPC2 HEPC6       |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       |                 | XAB                 | XRP     | G30   | HEPC2  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | X5B                 | XUN     | G30   | HEPC2  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | NC       |                 | X5B                 | XNX     | G30   |        | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | CX       |                 | X5B                 | XNX     | G30   | HEPC3  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AG      | CX       |                 | XAB                 | XNX     | G30   | HEPC3  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       |                 | X5B                 | XNX     | G30   | HEPC4  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | NC       | NVX             |                     |         | G30   |        | HEPC1             |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       | NVX             |                     |         | L30   |        | HEPC9 HEPC14      |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       |                 | X5B                 | XIN     | G30   |        | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | NC       |                 | XPN                 |         | G30   | HEPC1  | HEPC2 HEPC6       |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       |                 | XAB                 | XRP     | G30   | HEPC2  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | X5B                 | XUN     | G30   | HEPC2  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | NC       |                 | X5B                 | XNX     |       | G30    | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | CX       |                 | X5B                 | XNX     | G30   | HEPC3  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AG      | CX       |                 | XAB                 | XNX     | G30   | HEPC3  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       |                 | X5B                 | XNX     | G30   | HEPC4  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BL      | NC       |                 | X5B                 | XRP     | G30   | HEPC4  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 3XX      | NC       |                 | X5B                 | XRP     | L30   | G30    | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | CX       |                 | X5B                 | XUN     | G30   | HEPC5  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BL      | CX       |                 | XPN                 | XRP     | G30   | HEPC5  | HEPC3 HEPC5 HEPC6 |  |
      | algo       | demogp123@gmail.com | pass123  | 1AG      | CX       |                 | XAB                 | XRP     | G30   | HEPC5  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       |                 | XPN                 | XRP     | G30   | HEPC6  | HEPC2 HEPC6       |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | CX       |                 | XPN                 | XRP     | G30   | HEPC6  | HEPC3 HEPC5 HEPC6 |  |
      | algo       | demogp123@gmail.com | pass123  | 3XX      | CX       |                 | XPN                 | XUN     | G30   | HEPC6  | HEPC5 HEPC6 HEPC12 HEPC13|  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | X5B                 | XUN     | G30   | HEPC6  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BL      | CX       |                 | X5B                 | XUN     | L30   | HEPC8  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | NC       |                 | X5B                 | XUN     | L30   | HEPC8  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BL      | CX       |                 | XPN                 | XNX     | G30   | HEPC8  | HEPC3 HEPC5 HEPC6 |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | X5B                 | XUN     | G30   | HEPC9  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | NC       |                 | X5B                 | XUN     | L30   | HEPC9  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | X5B                 | XNX     | G30   | HEPC9  | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AG      | NC       | NVX             |                     |         | G30   | HEPC9  | HEPC2 HEPC4 HEPC9 HEPC14|  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | CX       |                 | X5B                 | XUN     | G30   | HEPC10 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | X5B                 | XUN     | L30   | HEPC10 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | NC       |                 | XPN                 | XNX     | G30   | HEPC11 | HEPC11            |  |
      | algo       | demogp123@gmail.com | pass123  | 3XX      | CX       |                 | X5B                 | XUN     | G30   | HEPC12 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 4XX      | NC       |                 | XPN                 |         | G30   | HEPC13 | HEPC13            |  |
      | algo       | demogp123@gmail.com | pass123  | 6XX      | NC       |                 | X5B                 | XUN     | G30   | HEPC13 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 5XX      | NC       |                 | XPN                 |         | G30   | HEPC13 | HEPC13            |  |
      | algo       | demogp123@gmail.com | pass123  | 3XX      | CX       |                 | X5B                 |         | G30   | HEPC13 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 4XX      | NC       |                 | X5B                 | XUN     | G30   | HEPC14 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | XAB                 |         | L30   | HEPC14 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | NC       | NVX             |                     |         | L30   | HEPC14 | HEPC8 HEPC14      |  |
      | algo       | demogp123@gmail.com | pass123  | 1BL      | CX       |                 | X5B                 | XUN     | G30   | HEPC14 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | NC       |                 | XPN                 |         | G30   | HEPC14 | HEPC1 HEPC2 HEPC6 |  |
      | algo       | demogp123@gmail.com | pass123  | 4XX      | CX       |                 | X5B                 | XUN     | G30   | HEPC14 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | XPN                 |         | G30   | HEPC15 | HEPC2 HEPC3 HEPC5 HEPC6|  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | CX       |                 | X5B                 | XUN     | L30   | HEPC15 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 4XX      | NC       |                 | XPN                 |         | G30   | HEPC15 | HEPC13            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AG      | NC       | NVX             |                     |         | L30   | HEPC15 | HEPC14            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | X5B                 | XNX     | L30   | HEPC16 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AG      | NC       |                 | X5B                 | XNX     | G30   | HEPC16 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 4XX      | NC       |                 | X5B                 | XNX     | G30   | HEPC16 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | CX       |                 | X5B                 | XNX     | G30   | HEPC16 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | NC       |                 | X5B                 | XUN     | L30   | HEPC16 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 6XX      | NC       |                 | X5B                 | XUN     | L30   | HEPC16 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 5XX      | CX       |                 | X5B                 | XUN     | L30   | HEPC16 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | NVX             |                     |         | L30   | HEPC16 | HEPC9 HEPC14      |  |
      | algo       | demogp123@gmail.com | pass123  | 1BU      | NC       |                 | XAB                 | XNX     | L30   | HEPC16 | HEPC16            |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | NC       |                 | X5B                 | XRP     | G30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 3XX      | CX       |                 | XAB                 | XNX     | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 1AU      | CX       |                 | XAB                 | XNX     | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 6XX      | NC       |                 | X5B                 | XNX     | G30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 5XX      | NC       |                 | XAB                 | XNX     | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | CX       |                 | X5B                 | XRP     | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | NC       | NVX             |                     | XRP     | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | NC       |                 | X5B                 | XRP     | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 6XX      | CX       |                 | XAB                 | XRP     | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | CX       |                 | XAB                 | XRP     | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | CX       |                 | XAB                 | XRP     | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | NC       | NVX             |                     | XRP     | G30   | HEPC1  |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | NC       | XIN             | X5B                 |         | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 6XX      | CX       | XNX             | X5B                 |         | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | CX       | NVX             | X5B                 |         | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 2XX      | CX       | XRP             | X5B                 |         | L30   | HEPC16 |                   |  |
      | algo       | demogp123@gmail.com | pass123  | 1AL      | NC       | NVX             | X5B                 | XPN     | G30   | HEPC1  |                   |  |
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #
  #Scenario Outline: Tool Check
    #Scenario 1: Treatment option displayed
    #Given I want to login to portal "<PortalName>"
    #And I wait for "10000" millisecond
    #And I enter the details as
      #| Fields        | Value      |
      #| email         | <email>    |
      #| inputPassword | <Password> |
    #And I hit Enter
    #And I wait for "2000" millisecond
    #Then I click on image "icon_menu"
    #And I wait for "1000" millisecond
    #And I click on " Algorithm -Single combination"
    #And I select "<GenoType>" from "Gender"
    #And I wait for "1000" millisecond
    #And I select "<Fibrosis>" from "Fibrosis"
    #And I select "<TreatmentOutcome>" from "Treatment Outcome"
    #And I select "<Therapy>" from "Therapy"
    #And I select "<Renal>" from "Renal"
    #And I click on "Submit "
    #Then I see text "<Result>" displayed
#
    #Examples: 
      #| PortalName | email               | Password | GenoType | Fibrosis | TreatmentOutcome | Therapy | Renal | Result | Expected UI Value |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | NC       | NVX              | XPN     | G30   | HEPC1  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AU      | NC       | XNX              | XIF     | G30   | HEPC2  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | NVX              | XPN     | G30   | HEPC2  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BU      | NC       | NVX              |         | G30   | HEPC2  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BU      | CX       | XRP              | XIF     | G30   | HEPC3  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AG      | CX       | XNX              | XIF     | G30   | HEPC3  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AU      | NC       | XUN              | XIF     | G30   | HEPC4  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BL      | NC       | XRP              | XPN     | G30   | HEPC4  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 3XX      | NC       | XRP              | XIF     | G30   | HEPC4  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BU      | CX       | XIN              | XIF     | G30   | HEPC5  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BL      | CX       | XRP              | XPN     | G30   | HEPC5  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AG      | CX       | XIN              | XPN     | G30   | HEPC5  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AU      | NC       | XIN              | XPN     | G30   | HEPC6  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BU      | CX       | NVX              | XPN     | G30   | HEPC6  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 3XX      | CX       | XIN              | XPN     | G30   | HEPC6  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | NVX              |         | G30   | HEPC6  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BL      | CX       | XNX              | XIF     | L30   | HEPC8  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BU      | NC       | XIN              | XIF     | L30   | HEPC8  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BL      | CX       | XUN              | XPN     | G30   | HEPC8  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | XRP              | XIF     | G30   | HEPC9  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AU      | NC       | XNX              | XIF     | L30   | HEPC9  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | XRP              |         | G30   | HEPC9  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AG      | NC       | NVX              | XPN     | G30   | HEPC9  |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AU      | CX       | XUN              | XIF     | G30   | HEPC10 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | XNX              | XIF     | L30   | HEPC10 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 2XX      | NC       | XIN              | XPN     | G30   | HEPC11 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 3XX      | CX       | XNX              | XIF     | G30   | HEPC12 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 4XX      | NC       | XIN              | XPN     | G30   | HEPC13 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 6XX      | NC       | XIN              | XIF     | G30   | HEPC13 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 5XX      | NC       | XRP              | XPN     | G30   | HEPC13 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 3XX      | CX       | XNX              |         | G30   | HEPC13 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 4XX      | NC       | XRP              | XIF     | G30   | HEPC14 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | XRP              |         | L30   | HEPC14 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BU      | NC       | NVX              | XIF     | L30   | HEPC14 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BL      | CX       | XUN              | XIF     | G30   | HEPC14 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | NC       | XRP              | XPN     | G30   | HEPC14 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 4XX      | CX       | XRP              | XIF     | G30   | HEPC14 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | XNX              | XPN     | G30   | HEPC15 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AU      | CX       | XIN              | XIF     | L30   | HEPC15 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 4XX      | NC       | XIN              | XPN     | G30   | HEPC15 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AG      | NC       | XUN              | XIF     | L30   | HEPC15 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | XNX              | X5B     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AG      | NC       | XNX              | X5A     | G30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 4XX      | NC       | XUN              | X5A     | G30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BU      | CX       | XRP              | XAB     | G30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 2XX      | NC       | XNX              | XPN     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 6XX      | NC       | XIN              | XPN     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 5XX      | CX       | XNX              | XPN     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | NVX              | XAB     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1BU      | NC       | XUN              | XAB     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 2XX      | NC       | XNX              | X5A     | G30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 3XX      | CX       | XRP              | X5A     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AU      | CX       | XUN              | X5B     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 6XX      | NC       | XIN              | X5B     | G30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 5XX      | NC       | XRP              | X5B     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 1AL      | CX       | XNX              | XPN     | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 2XX      | NC       | NVX              |         | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 2XX      | NC       | XIN              |         | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 6XX      | CX       | XNX              |         | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 2XX      | CX       | NVX              |         | L30   | HEPC16 |                   |
      #| algo       | demogp123@gmail.com | pass123  | 2XX      | CX       | XRP              |         | L30   | HEPC16 |                   |
