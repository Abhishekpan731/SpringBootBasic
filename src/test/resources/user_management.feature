Feature: User Management

      Scenario: Create a new user
        Given the user details
        When the user is created
        Then the user should be available in the system

      Scenario: Get all users
        When all users are requested
        Then the list of users should be returned

      Scenario: Get user by ID
        Given a user with ID "1" exists
        When the user with ID "1" is requested
        Then the user details should be returned

      Scenario: Delete a user
        Given a user with ID "1" exists
        When the user with ID "1" is deleted
        Then the user should no longer be available in the system