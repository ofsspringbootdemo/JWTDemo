package com.jana.jpademo.service;

import com.jana.jpademo.model.Role;
import com.jana.jpademo.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {

    @Autowired
    private RoleRepository repository;

    public void saveOrUpdate(Role role) {
        repository.save(role);
    }

    public List<Role> getAll() {
        return repository.findAll();
    }

    public Role find(String name) {
        return repository.findByName(name);
    }

    public void delete(int id) {
        repository.deleteById(id);
    }
}
