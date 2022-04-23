package com.example.feedback

import com.example.feedback.repositry.Behavior
import com.example.feedback.repositry.BehaviorRepository
import com.example.feedback.repositry.EpisodeRepositry
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/")
class FeedbackController (
    private val repository: BehaviorRepository
){
    @GetMapping("/ping")
    fun ping(): String {
        return "pong"
    }

    @GetMapping("/behavior")
    fun getAll(@RequestParam(name = "memberName", defaultValue="") memberName: String) : List<BehaviorJson> {
        val contentsList = repository.findAll()
        return contentsList.filter { it.member.name == memberName }.map { it.toJson() }
    }
}

private fun Behavior.toJson() =
    BehaviorJson(
        this.id,
        this.episode.contents,
        this.member.name,
        this.contents
    )

data class BehaviorJson(
    val id: String,
    val episode: String,
    val member: String,
    val behavior: String,
)