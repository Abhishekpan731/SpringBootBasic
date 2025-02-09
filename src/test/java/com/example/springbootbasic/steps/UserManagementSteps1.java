package com.example.springbootbasic.steps;

import com.example.springbootbasic.entity.User;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
public class UserManagementSteps1 {

    @Autowired
    private RestTemplate restTemplate;

    private ResponseEntity<User> response;

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
}