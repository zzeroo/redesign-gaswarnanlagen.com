Feature: Home page
  Background:
    Given a global administrator named "webmaster@gaswarnanlagen.com"
    And a category named "Category without parents" without "parents"

  Scenario: Viewing application's home page
    Given there's a category named "Category 1" with true published
    And none parent
    When I am on the homepage
    Then I should see the "Category 1" category
