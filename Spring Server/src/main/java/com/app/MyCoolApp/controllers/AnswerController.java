package com.app.MyCoolApp.controllers;

import com.app.MyCoolApp.models.Answer;
import com.app.MyCoolApp.models.User;
import com.app.MyCoolApp.repository.SampleAnswerRepository;
import com.app.MyCoolApp.services.AnswerService;
import com.app.MyCoolApp.services.SampleService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1")
public class AnswerController {
    @Autowired
    AnswerService answerService;
    @Autowired
    SampleService sampleService;

    @RequestMapping(value = "/answer", method = RequestMethod.POST, consumes = {"application/json"}, produces = {"application/json"})
    @ResponseBody
    public String answer(@RequestBody Answer answer) {
        answerService.saveAnswer(answer);
        return "done";
    }


    }

