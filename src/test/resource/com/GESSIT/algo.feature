Feature: wip

  @algo
  Scenario Outline: GES-167
    #Scenario 1: Treatment option displayed
    Given I want to login to portal "<PortalName>"
    And I wait for "10000" millisecond
    And I enter the details as
      | Fields        | Value      |
      | UserName      | <UserName> |
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

    #Ges-72
    Examples: 
      | PortalName | UserName      | Password | GenoType | Fibrosis | TreatmentOutcome | Therapy | Renal | Result |
      | algo       | test@test.com | pass123  | 1AL      | NC       | NVX              | XPN     | G30   | HEPC1  |
      | algo       | test@test.com | pass123  | 2XX      | NC       | NVX              |         | L30   | HEPC16 |
      | algo       | test@test.com | pass123  | 1AU      | NC       | XNX              | XIF     | G30   | HEPC2  |
      | algo       | test@test.com | pass123  | 1AL      | CX       | NVX              | XPN     | G30   | HEPC2  |
      | algo       | test@test.com | pass123  | 1BU      | CX       | XRP              | XIF     | G30   | HEPC3  |
      | algo       | test@test.com | pass123  | 1AG      | CX       | XNX              | XIF     | G30   | HEPC3  |
      | algo       | test@test.com | pass123  | 1AU      | NC       | XUN              | XIF     | G30   | HEPC4  |
      | algo       | test@test.com | pass123  | 1BL      | NC       | XRP              | XPN     | G30   | HEPC4  |
      | algo       | test@test.com | pass123  | 3XX      | NC       | XRP              | XIF     | G30   | HEPC4  |
      | algo       | test@test.com | pass123  | 1BU      | CX       | XIN              | XIF     | G30   | HEPC5  |
      | algo       | test@test.com | pass123  | 1BL      | CX       | XRP              | XPN     | G30   | HEPC5  |
      | algo       | test@test.com | pass123  | 1AG      | CX       | XIN              | XPN     | G30   | HEPC5  |
      | algo       | test@test.com | pass123  | 1AU      | NC       | XIN              | XPN     | G30   | HEPC6  |
      | algo       | test@test.com | pass123  | 1BU      | CX       | NVX              | XPN     | G30   | HEPC6  |
      | algo       | test@test.com | pass123  | 3XX      | CX       | XIN              | XPN     | G30   | HEPC6  |
      | algo       | test@test.com | pass123  | 1BL      | CX       | XNX              | XIF     | L30   | HEPC8  |
