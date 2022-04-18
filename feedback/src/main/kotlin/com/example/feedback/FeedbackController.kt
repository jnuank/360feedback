package com.example.feedback

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/")
class FeedbackController {

    @GetMapping("/ping")
    fun getAll(): String {
        return "pong"
    }

}