package com.example.feedback.repositry

import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface MemberRepository : JpaRepository<Member, String> {

    override fun findById(id: String): Optional<Member>
    override fun findAll(): MutableList<Member>
}