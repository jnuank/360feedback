package com.example.feedback

import com.example.feedback.repositry.*
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.time.LocalDate
import java.util.*
import javax.websocket.server.PathParam

@RestController
@RequestMapping("/")
class FeedbackController (
    private val repository: BehaviorRepository,
    private val episodeRepositry: EpisodeRepositry,
    private val memberRepository: MemberRepository,
){
    @GetMapping("/ping")
    fun ping(): String {
        return "pong"
    }

    @GetMapping("/behaviors")
    fun getAll(@RequestParam(name = "memberName", defaultValue="") memberName: String) : BehaviorsJson {
        val contentsList = repository.findAll()
        return contentsList.filter { it.member.name == memberName }.map { it.toJson() }.let(::BehaviorsJson)
    }

    @GetMapping("/episodes")
    fun getEpisode() : EpisodesJson {
        val episodes = episodeRepositry.findAll()
        return episodes.map { it.toJson() }.let(::EpisodesJson)
    }

    @PostMapping("/episodes")
    fun postEpisode(@RequestBody episode: EpisodeRequest): UUID {
        val episodeEntity = Episode(id = UUID.randomUUID(), date = episode.date, contents = episode.contents)
        val result = episodeRepositry.save(episodeEntity)
        return result.id
    }

    @PostMapping("/episodes/{id}/behavior")
    fun postBehavior(
        @PathVariable("id") episodeId: UUID,
        @RequestBody behavior: BehaviorRequest)
    {
        val episodeEntity = episodeRepositry.findById(episodeId).get()
        val memberEntity = memberRepository.findByNameIgnoreCase(behavior.memberName).get()
        val behaviorEntity = Behavior(UUID.randomUUID(), episodeEntity, memberEntity, behavior.contents)
        repository.save(behaviorEntity)
    }
}

data class BehaviorsJson(
    val behaviors: List<BehaviorJson>
)

private fun Behavior.toJson() =
    BehaviorJson(
        this.id.toString(),
        this.episode.date,
        this.episode.contents,
        this.member.name,
        this.contents
    )

private fun Episode.toJson() =
    EpisodeJson(
        this.id.toString(),
        this.date,
        this.contents
    )

data class BehaviorJson(
    val id: String,
    val date: LocalDate,
    val episode: String,
    val member: String,
    val behavior: String,
)

data class EpisodesJson(
    val values: List<EpisodeJson>
)

data class EpisodeJson(
    val id: String,
    val date: LocalDate,
    val contents: String,
)

data class EpisodeRequest(
    val date: LocalDate,
    val contents: String,
)

data class BehaviorRequest(
    val memberName: String,
    val contents: String,
)