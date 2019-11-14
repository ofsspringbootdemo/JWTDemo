package com.jana.jpademo.controller;

import com.jana.jpademo.model.Role;
import com.jana.jpademo.model.User;
import com.jana.jpademo.service.RoleService;
import com.jana.jpademo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/save")
    public void saveUser(@RequestBody User user) {

        Set<Role> roles = new HashSet<>();

        for (Role role: user.getRoles()) {

            Role userRole;
            try {
                userRole = roleService.find(role.getName());
                if (userRole == null) {
                    userRole = new Role(role.getName());
                }
            } catch (RuntimeException e) {
                userRole = new Role(role.getName());
            }

            roles.add(userRole);
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles(roles);
        userService.saveOrUpdate(user);
    }

    @GetMapping
    public List<User> getAllUser() {
        return userService.getAll();
    }

}
