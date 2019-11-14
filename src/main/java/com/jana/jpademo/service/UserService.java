package com.jana.jpademo.service;

import com.jana.jpademo.model.Role;
import com.jana.jpademo.model.User;
import com.jana.jpademo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository repository;

    public void saveOrUpdate(User user) {
        repository.save(user);
    }

    public User getUser(String email) {
        return repository.findByEmail(email);
    }

    public List<User> getAll() {
        return repository.findAll();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = getUser(username);
        if (user != null) {

            Set<SimpleGrantedAuthority> authorities = new HashSet<>();

            for (Role role : user.getRoles()) {
                authorities.add(new SimpleGrantedAuthority(role.getName()));
            }

            return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(),
                    authorities);
        } else {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }
    }
}
