package com.example.feedback.repositry

import java.util.*
import javax.persistence.*

@Entity
@Table(schema = "フィードバック", name = "行動")
data class Behavior(
    @Id
    @Column(name = "Id")
    val id: UUID,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "エピソードid")
    val episode: Episode,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "メンバーid")
    val member: Member,

    @Column(name = "内容")
    val contents: String
)