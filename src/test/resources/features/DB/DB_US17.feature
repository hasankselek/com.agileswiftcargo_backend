Feature:[US_17]social_links table_linking verify

  Background: Common Steps

    * Database connection established


  Scenario:Verify whether the links in the social_links table are the correct links in the database.

    Given Prepare query for identifying the URL addresses in the social_links table that aren't valid link.
    When Verify that URL address of links are valid.
    Then Verify that URL address of links until entire row with name column compared.
    And Database closed

