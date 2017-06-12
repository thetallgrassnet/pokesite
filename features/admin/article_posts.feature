Feature: Admin Article::Posts
  Allow authors to create posts for their articles and edit their own posts.

  Scenario: Author can create posts in assigned column
    Given an author
    And a column
    When I sign in to admin
    And I visit the admin article posts path
    And I click "New Article Post"
    Then I should have 1 column available
