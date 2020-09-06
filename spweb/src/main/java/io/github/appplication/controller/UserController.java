package io.github.appplication.controller;

import io.github.appplication.model.User;
import io.github.appplication.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

//@RestController(value = "/api/v1")
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/users")
    List<User> all() {
        return userRepository.findAll();
    }

    @GetMapping("/users/{id}")
    User one(@PathVariable Long id) throws Exception {
        return userRepository.findById(id).orElseThrow(() -> new Exception("not found"));
    }

    @PutMapping("/users/{id}")
    User replace(@RequestBody User user, @PathVariable Long id) {
        return userRepository.findById(id)
                .map(dbUser -> {
                    dbUser.setName(user.getName());
                    dbUser.setEmail(user.getEmail());
                    return userRepository.save(dbUser);
                })
                .orElseGet(() -> {
                    user.setId(id);
                    return userRepository.save(user);
                });
    }

    @PostMapping("/users")
    User newUser(@RequestBody User newUser) {
        return userRepository.save(newUser);
    }
}