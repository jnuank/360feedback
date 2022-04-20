package com.example.feedback.repositry

import javax.persistence.Column
import javax.persistence.Embeddable
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.MappedSuperclass
import javax.persistence.Table

@Entity
@Table(name = "episode", schema = "feedback")
data class Episode (
    @Id
    @Column(name = "id")
    val id: Long,

    @Column(name = "contents")
    val contents: String
)