package com.example.feedback.repositry

import java.time.LocalDate
import java.util.*
import javax.persistence.*

@Entity
@Table(name = "エピソード", schema = "フィードバック")
data class Episode(
    @Id
    @Column(name = "Id")
    val id: UUID,

    @Column(name = "日付")
    val date: LocalDate,

    @Column(name = "内容")
    val contents: String
)