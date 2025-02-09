package com.example.springbootbasic.services;
import com.example.springbootbasic.entity.User;
import com.example.springbootbasic.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public Optional<User> getUserById(String id) {
        return userRepository.findById(id);
    }

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public void deleteUser(String id) {
        userRepository.deleteById(id);
    }
    public void insert100Users() {
        for (int i = 1; i <= 100; i++) {
            String userId = String.valueOf(i);
            if (!userRepository.existsById(userId)) {
                User user = new User();
                user.setId(userId);
                user.setName("User" + i);
                user.setEmail("user" + i + "@example.com");
                userRepository.save(user);
            }
        }
    }
}