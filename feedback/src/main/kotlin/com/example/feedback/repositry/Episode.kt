package com.example.feedback.repositry

import java.time.LocalDate
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Table

@Entity
@Table(name = "エピソード", schema = "フィードバック")
data class Episode(
    @Id
    @Column(name = "Id")
    val id: String,

    @Column(name = "日付")
    val date: LocalDate,

    @Column(name = "内容")
    val contents: String
)