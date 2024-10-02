package com.praveen.cicd.cicdpipeline.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/praveen")
public class TestController {

    @GetMapping("/check")
    public ResponseEntity<Map<String,String>> check() {
     return ResponseEntity.ok().body(Map.of("Testing","UP AND RUNNING"));
    }
}
