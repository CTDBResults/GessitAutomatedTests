Feature: wip

  @algo
  Scenario Outline: GES-167
    #Scenario 1: Treatment option displayed
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | email         | <email>    |
      | inputPassword | <Password> |
    And I hit Enter
    And I wait for "2000" millisecond
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    And I click on " Algorithm -Single combination"
    And I select "<GenoType>" from "Gender"
    And I wait for "1000" millisecond
    And I select "<Fibrosis>" from "Fibrosis"
    And I select "<TreatmentOutcome>" from "Treatment Outcome"
    And I select "<Therapy>" from "Therapy"
    And I select "<Renal>" from "Renal"
    And I click on "Submit "
    Then I see text "<Result>" displayed

    Examples: 
      | PortalName | email            | Password   | GenoType | Fibrosis | TreatmentOutcome | Therapy | Renal | Result |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | NC       | NVX              | XPN     | G30   | HEPC1  |
      | algo       | demogp123@gmail.com | pass123 | 1AU      | NC       | XNX              | XIF     | G30   | HEPC2  |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | NVX              | XPN     | G30   | HEPC2  |
      | algo       | demogp123@gmail.com | pass123 | 1BU      | NC       | NVX              |         | G30   | HEPC2  |
      | algo       | demogp123@gmail.com | pass123 | 1BU      | CX       | XRP              | XIF     | G30   | HEPC3  |
      | algo       | demogp123@gmail.com | pass123 | 1AG      | CX       | XNX              | XIF     | G30   | HEPC3  |
      | algo       | demogp123@gmail.com | pass123 | 1AU      | NC       | XUN              | XIF     | G30   | HEPC4  |
      | algo       | demogp123@gmail.com | pass123 | 1BL      | NC       | XRP              | XPN     | G30   | HEPC4  |
      | algo       | demogp123@gmail.com | pass123 | 3XX      | NC       | XRP              | XIF     | G30   | HEPC4  |
      | algo       | demogp123@gmail.com | pass123 | 1BU      | CX       | XIN              | XIF     | G30   | HEPC5  |
      | algo       | demogp123@gmail.com | pass123 | 1BL      | CX       | XRP              | XPN     | G30   | HEPC5  |
      | algo       | demogp123@gmail.com | pass123 | 1AG      | CX       | XIN              | XPN     | G30   | HEPC5  |
      | algo       | demogp123@gmail.com | pass123 | 1AU      | NC       | XIN              | XPN     | G30   | HEPC6  |
      | algo       | demogp123@gmail.com | pass123 | 1BU      | CX       | NVX              | XPN     | G30   | HEPC6  |
      | algo       | demogp123@gmail.com | pass123 | 3XX      | CX       | XIN              | XPN     | G30   | HEPC6  |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | NVX              |         | G30   | HEPC6  |
      | algo       | demogp123@gmail.com | pass123 | 1BL      | CX       | XNX              | XIF     | L30   | HEPC8  |
      | algo       | demogp123@gmail.com | pass123 | 1BU      | NC       | XIN              | XIF     | L30   | HEPC8  |
      | algo       | demogp123@gmail.com | pass123 | 1BL      | CX       | XUN              | XPN     | G30   | HEPC8  |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | XRP              | XIF     | G30   | HEPC9  |
      | algo       | demogp123@gmail.com | pass123 | 1AU      | NC       | XNX              | XIF     | L30   | HEPC9  |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | XRP              |         | G30   | HEPC9  |
      | algo       | demogp123@gmail.com | pass123 | 1AG      | NC       | NVX              | XPN     | G30   | HEPC9  |
      | algo       | demogp123@gmail.com | pass123 | 1AU      | CX       | XUN              | XIF     | G30   | HEPC10 |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | XNX              | XIF     | L30   | HEPC10 |
      | algo       | demogp123@gmail.com | pass123 | 2XX      | NC       | XIN              | XPN     | G30   | HEPC11 |
      | algo       | demogp123@gmail.com | pass123 | 3XX      | CX       | XNX              | XIF     | G30   | HEPC12 |
      | algo       | demogp123@gmail.com | pass123 | 4XX      | NC       | XIN              | XPN     | G30   | HEPC13 |
      | algo       | demogp123@gmail.com | pass123 | 6XX      | NC       | XIN              | XIF     | G30   | HEPC13 |
      | algo       | demogp123@gmail.com | pass123 | 5XX      | NC       | XRP              | XPN     | G30   | HEPC13 |
      | algo       | demogp123@gmail.com | pass123 | 3XX      | CX       | XNX              |         | G30   | HEPC13 |
      | algo       | demogp123@gmail.com | pass123 | 4XX      | NC       | XRP              | XIF     | G30   | HEPC14 |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | XRP              |         | L30   | HEPC14 |
      | algo       | demogp123@gmail.com | pass123 | 1BU      | NC       | NVX              | XIF     | L30   | HEPC14 |
      | algo       | demogp123@gmail.com | pass123 | 1BL      | CX       | XUN              | XIF     | G30   | HEPC14 |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | NC       | XRP              | XPN     | G30   | HEPC14 |
      | algo       | demogp123@gmail.com | pass123 | 4XX      | CX       | XRP              | XIF     | G30   | HEPC14 |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | XNX              | XPN     | G30   | HEPC15 |
      | algo       | demogp123@gmail.com | pass123 | 1AU      | CX       | XIN              | XIF     | L30   | HEPC15 |
      | algo       | demogp123@gmail.com | pass123 | 4XX      | NC       | XIN              | XPN     | G30   | HEPC15 |
      | algo       | demogp123@gmail.com | pass123 | 1AG      | NC       | XUN              | XIF     | L30   | HEPC15 |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | XNX              | X5B     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 1AG      | NC       | XNX              | X5A     | G30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 4XX      | NC       | XUN              | X5A     | G30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 1BU      | CX       | XRP              | XAB     | G30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 2XX      | NC       | XNX              | XPN     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 6XX      | NC       | XIN              | XPN     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 5XX      | CX       | XNX              | XPN     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | NVX              | XAB     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 1BU      | NC       | XUN              | XAB     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 2XX      | NC       | XNX              | X5A     | G30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 3XX      | CX       | XRP              | X5A     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 1AU      | CX       | XUN              | X5B     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 6XX      | NC       | XIN              | X5B     | G30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 5XX      | NC       | XRP              | X5B     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 1AL      | CX       | XNX              | XPN     | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 2XX      | NC       | NVX              |         | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 2XX      | NC       | XIN              |         | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 6XX      | CX       | XNX              |         | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 2XX      | CX       | NVX              |         | L30   | HEPC16 |
      | algo       | demogp123@gmail.com | pass123 | 2XX      | CX       | XRP              |         | L30   | HEPC16 |
