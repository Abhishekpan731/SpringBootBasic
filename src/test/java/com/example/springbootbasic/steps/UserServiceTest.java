package com.example.springbootbasic;

import com.example.springbootbasic.entity.User;
import com.example.springbootbasic.repo.UserRepository;
import com.example.springbootbasic.services.UserService;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UserService userService;

    public UserServiceTest() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testGetUserById() {
        User user = new User();
        user.setId("1");
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");

        when(userRepository.findById("1")).thenReturn(Optional.of(user));

        Optional<User> result = userService.getUserById("1");

        assertEquals("John Doe", result.get().getName());
        verify(userRepository, times(1)).findById("1");
    }
}