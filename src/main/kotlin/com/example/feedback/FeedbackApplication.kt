package com.example.feedback

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
open class FeedbackApplication

fun main(args: Array<String>) {
	runApplication<FeedbackApplication>(*args)
}
