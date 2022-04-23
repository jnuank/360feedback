package com.example.feedback.repositry

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface EpisodeRepositry: JpaRepository<Episode, String> {

    override fun findById(id: String): Optional<Episode>
    override fun findAll(): MutableList<Episode>
}