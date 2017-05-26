Feature: some feature

  Scenario Outline: preceded by below  test case and create a care unit which will be attached to above practitioner
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
    And I enter the details as
      | Fields        | Value            |
      | name          | <name>           |
      | contactEmail  | <Contact Email>  |
      | address_1     | <Address Line 1> |
      | contactNumber | <Contact Number> |
      | postcode      | <Postcode>       |
      | suburb        | <Suburb>         |
    And I click on "Select"
    And on popup I select "VIC" from "state"
    And I capture "name"
    And I click on "Submit"

    Examples: 
      | PortalName | email                         | Password | name    | Postcode | Address Line 1 | Contact Number | Contact Email | Suburb    |
      | Gessit     | hemant.shori@dbresults.com.au | pass123  | bhonsdu |     3000 | 13 Kona St     |       99880099 | test@test.com | Melbourne |

  @wip
  Scenario Outline: As an Administrator, I want the ability to create a Practitioner GES-192
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
    And I click on "New Practitioner"
    And I see popup "createPractitionerModalLabel" displayed
    And I enter the details as
      | Fields          | Value            |
      | emailAddress    | <emailAddress>   |
      | firstName       | <firstName>      |
      | lastName        | <lastName>       |
      | contactNumber   | <contactNumber>  |
      | specialisation  | <specialisation> |
      | password        | <password>       |
      | confirmPassword | <password>       |
    And on popup I select "Dr" from "title"
    And on popup I select "Specialist" from "role"
    And I capture "emailAddress"
    And I hit Enter
    And I click on button "submitCreate"
    And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <firstName> |
    And I click on button "searchButtonInput"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <firstName> |
      | item2 | <lastName>  |
    # Adding CU created above TC
    And I click on captured "email"
    And I wait for "1000" millisecond
    And I click on "addToCareUnit" on popup
    And I wait for "1000" millisecond
    And on popup I select "firstone" from "associateCareUnit"
    And I click on "addAssociation" on popup
    And I enter popup values as
      | Fields                 | Value    |
      | careUnitProviderNumber | <ProviderNo> |
      And I click on "addAssociation" on popup
      And I click on "cancelEdit" on popup
      
       And I enter the details as
      | Fields          | Value       |
      | searchtextInput | <firstName> |
    And I click on button "searchButtonInput"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <firstName> |
      | item2 | <lastName>  |
    # Adding CU created above TC
    And I click on captured "email"
    
        Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item1 | <ProviderNo> |
    
# verify if CU added successfully

    #Then I click on image "icon_menu"
    #And I wait for "1000" millisecond
    #Then I click on image "logout"
    # login again as practitioner created above
    #And I wait for "1000" millisecond
    #Then I click on button "loginAgain"
    #And I wait for "1000" millisecond
    #And I paste "email"
    #And I enter the details as
    #| Fields        | Value            |
    #| inputPassword | <specialisation> |
    #And I hit Enter
    #And I check I am on "My Tasks" page
    Examples: 
      | PortalName | email                         | Password | FirstName   | firstName             | lastName               |ProviderNo| contactNumber | emailAddress      | specialisation | password       |
      | Gessit     | hemant.shori@dbresults.com.au | pass123  | Bobbyprodtt | chooktafatta| practionerdasecondname |12345674 |     00001111 | h@1d0n0texixt.com | Anypassword123 | Anypassword123 |
