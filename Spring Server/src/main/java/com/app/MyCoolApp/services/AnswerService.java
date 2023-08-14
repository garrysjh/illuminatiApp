package com.app.MyCoolApp.services;

import com.app.MyCoolApp.models.Answer;
import com.app.MyCoolApp.repository.AnswerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerService {
    @Autowired
    AnswerRepository answerRepository;

    public void saveAnswer(Answer answer){
        answerRepository.save(answer);
    }


    public int checkQn(int question, int answer){
        return answerRepository.checkQn(question, answer);
    }
    public int checkQ1(int answer){
        return answerRepository.checkQn1(answer);
    }
    public int checkQ2(int answer){
        return answerRepository.checkQn2(answer);
    }

    public void deleteAll() {
        answerRepository.deleteAll();
    }
}
