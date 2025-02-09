package com.example.springbootbasic.steps;

import com.example.springbootbasic.entity.User;
import com.example.springbootbasic.repo.UserRepository;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
public class UserManagementSteps2 {

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private UserRepository userRepository;

    private ResponseEntity<User> response;
    private ResponseEntity<List> listResponse;

    @Given("the user details")
    public void the_user_details() {
        // Setup user details
    }

    @When("the user is created")
    public void the_user_is_created() {
        User user = new User();
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");
        response = restTemplate.postForEntity("/users", user, User.class);
    }

    @Then("the user should be available in the system")
    public void the_user_should_be_available_in_the_system() {
        assertEquals(201, response.getStatusCodeValue());
    }

    @When("all users are requested")
    public void all_users_are_requested() {
        listResponse = restTemplate.getForEntity("/users", List.class);
    }

    @Then("the list of users should be returned")
    public void the_list_of_users_should_be_returned() {
        assertEquals(200, listResponse.getStatusCodeValue());
        assertTrue(listResponse.getBody().size() > 0);
    }

    @Given("a user with ID {string} exists")
    public void a_user_with_ID_exists(String id) {
        User user = new User();
        user.setId(id);
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");
        userRepository.save(user);
    }

    @When("the user with ID {string} is requested")
    public void the_user_with_ID_is_requested(String id) {
        response = restTemplate.getForEntity("/users/" + id, User.class);
    }

    @Then("the user details should be returned")
    public void the_user_details_should_be_returned() {
        assertEquals(200, response.getStatusCodeValue());
        assertEquals("John Doe", response.getBody().getName());
    }

    @When("the user with ID {string} is deleted")
    public void the_user_with_ID_is_deleted(String id) {
        restTemplate.delete("/users/" + id);
    }

    @Then("the user should no longer be available in the system")
    public void the_user_should_no_longer_be_available_in_the_system() {
        response = restTemplate.getForEntity("/users/1", User.class);
        assertEquals(404, response.getStatusCodeValue());
    }
}