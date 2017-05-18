Feature: Some 
  Scenario Outline: GES-192 As an Administrator, I want the ability to create a Practitioner
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
    And I check I am on "Manage Practitioners" page
    And I wait for "1000" millisecond
    And I click on "New Practitioner"
    And I see popup "modal-body-create-practitioner" displayed
    And I click on "submitCreate" on popup
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                      |
      | item1 | First Name is mandatory       |
      | item1 | Last Name is mandatory        |
      | item2 | Contact number is mandatory   |
      | item3 | Email address is mandatory    |
      | item4 | Role is mandatory             |
      | item5 | Specialisation is mandatory   |
      | item6 | Password is mandatory         |
      | item7 | Password                      |
      | item8 | Confirm Password is mandatory |
    And on popup I select "Mr" from "selectTitle"
    And I enter popup values as
      | Fields          | Value           |
      | firstName       | <firstName>     |
      | lastName        | <lastName>      |
      | contactNumber   | <contactNumber> |
      | emailAddress    | <emailAddress>  |
      | specialisation  | velad           |
      | password        | Onetwoka4       |
      | confirmPassword | Onetwoka4       |
    And on popup I select "General Practitioner" from "selectRole"
    And I click on "submitCreate" on popup
    And I check I am on "Manage Practitioners" page
    Then I see the table "practitionerTable" displayed
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <FirstName> |
    And I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName        |
      | item1 | <firstName>     |
      | item2 | <lastName>      |
      | item2 | <contactNumber> |
      | item2 | <emailAddress>  |

    Examples: 
      | PortalName | email                         | Password | firstName               | lastName | contactNumber | emailAddress |
      | Gessit     | hemant.shori@dbresults.com.au | pass123  | AutoCreatePractioner | test     |    9999222292 | don@don.com  |
