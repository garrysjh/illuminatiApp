package com.app.MyCoolApp.controllers;

import com.app.MyCoolApp.models.Quiz;
import com.app.MyCoolApp.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1")
public class QuizController {
    @Autowired
    QuizService quizService;

    @GetMapping("/quiz")
    public Map<String, ?> getQuizzes() {
        return quizService.showQuizzes();
    }
}
