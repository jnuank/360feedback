package com.example.feedback.repositry

import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface BehaviorRepository : JpaRepository<Behavior, String> {
}