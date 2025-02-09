package com.example.springbootbasic.repo;
import com.example.springbootbasic.entity.User;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<User, String> {
}
