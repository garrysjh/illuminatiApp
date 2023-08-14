package com.app.MyCoolApp.services;

import com.app.MyCoolApp.models.Quiz;
import com.app.MyCoolApp.repository.QuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QuizService {
    @Autowired
    QuizRepository quizRepository;

    public Map<String, ?> showQuizzes(){
        return quizRepository.showQuizzes();
    }
}
