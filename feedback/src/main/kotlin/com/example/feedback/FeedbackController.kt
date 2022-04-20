package com.example.feedback

import com.example.feedback.repositry.Episode
import com.example.feedback.repositry.EpisodeRepositry
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/")
class FeedbackController (
    private val repository: EpisodeRepositry
){
    @GetMapping("/ping")
    fun ping(): String {
        return "pong"
    }

    @GetMapping("/getone")
    fun getAll() : String {
        val contentsList = repository.findAll()
        return contentsList.first().contents
    }

}