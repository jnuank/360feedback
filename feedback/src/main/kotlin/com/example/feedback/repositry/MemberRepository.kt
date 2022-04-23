package com.example.feedback.repositry

import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface MemberRepository : JpaRepository<Member, UUID> {
    fun findByNameIgnoreCase(name: String): Optional<Member>

}