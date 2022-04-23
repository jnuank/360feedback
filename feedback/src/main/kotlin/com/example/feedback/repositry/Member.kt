package com.example.feedback.repositry

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Table

@Entity
@Table(schema = "フィードバック",  name = "メンバー")
data class Member(
    @Id
    @Column(name = "Id")
    val id: String,

    @Column(name = "名前")
    val name: String
)