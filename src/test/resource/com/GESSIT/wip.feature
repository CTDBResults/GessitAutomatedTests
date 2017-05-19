@wip
Feature: some feature

  #@arvind defect give me admin logins
  Scenario Outline: GES-119, GES-621 As an Administrator, I want the ability to create and view Care Units
    Scenario 1: Administrator accesses Create Care Unit function

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
And I click on "Cancel"
And I click on "New Care Unit"
And I wait for "10000" millisecond

# @defect ....expected to fail
 Then I see text "Care Unit already exists" not displayed
    Examples: 
      | PortalName | email                         | Password | CareUnitNameValue | Postcode | Address Line 1 | Contact Number | Contact Email | Suburb    |
      | Gessit     | hemant.shori@dbresults.com.au | pass123  | Test119and621tnine     |     3000 | 13 Kona St     |       99880099 | test@test.com | Melbourne |
