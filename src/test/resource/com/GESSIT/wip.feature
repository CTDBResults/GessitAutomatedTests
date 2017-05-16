Feature: some feature

  @wip
  Scenario Outline: GES-820 As a System Admin I want to view the menu items so that I know what functions I have access to based on my role
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
    And I click on "Practitioners"
    And I check I am on "Manage Practitioners" page
    Then I see the table "practitionerTable" displayed
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName       |
      | item1 | First Name     |
      | item2 | Last Name      |
      | item4 | Email Address  |
      | item5 | Contact Number |
    #check care units Items
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    And I click on "Care Units"
    And I check I am on "Care Units" page
    # Check reports
    Then I click on image "icon_menu"
    And I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                    |
      | item1 | Reports                     |
      | item2 | Generate Initiations Report |
      | item4 | Download Initiations Report |
      |item5 | Algorithm - Single Combination|
      |item5 | Algorithm - All Combination|

    Examples: 
      | PortalName | email                         | Password | FirstName | CU    | EmailInput   | LastName | contactInput | medicare | postCode | ResidentialAddress1 | Weight | Height | ResidentialAddress2 | Suburb   |
      | Gessit     | hemant.shori@dbresults.com.au | pass123  | Bobby     | Royal | abwc@abc.com | Smith    |   0422000000 |        7 |     2222 | 344 Sector 9        |     44 |    123 | 3344 secto 19       | Oakleigh |
