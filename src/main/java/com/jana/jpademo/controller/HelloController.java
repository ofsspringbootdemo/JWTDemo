package com.jana.jpademo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/rest/api/hello")
public class HelloController {

    @GetMapping
    public String greetings() {
        return "Hello!!!";
    }
}
