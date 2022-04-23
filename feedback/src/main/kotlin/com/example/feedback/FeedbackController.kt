package com.example.feedback

import com.example.feedback.repositry.Behavior
import com.example.feedback.repositry.BehaviorRepository
import com.example.feedback.repositry.Episode
import com.example.feedback.repositry.EpisodeRepositry
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.time.LocalDate
import java.util.*

@RestController
@RequestMapping("/")
class FeedbackController (
    private val repository: BehaviorRepository,
    private val episodeRepositry: EpisodeRepositry,
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

    @PostMapping("/episode")
    fun postEpisode(@RequestBody episode: EpisodeRequest) {
        val episodeEntity = Episode(id = UUID.randomUUID(), date = episode.date, contents = episode.contents)
        episodeRepositry.save(episodeEntity)
    }
}

private fun Behavior.toJson() =
    BehaviorJson(
        this.id.toString(),
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

data class EpisodeRequest(
    val date: LocalDate,
    val contents: String,
)