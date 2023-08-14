package com.app.MyCoolApp.controllers;

import com.app.MyCoolApp.models.Answer;
import com.app.MyCoolApp.services.AnswerService;
import com.app.MyCoolApp.services.SampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class    SampleMain {
    @Autowired
    AnswerService answerService;

    @Autowired
    SampleService sampleService;
    @GetMapping("/")
    public String viewHomePage(){
        return "sampleqn";
    }

    @GetMapping("/quiz1")
    public String viewQuiz1(){
        return "quiz1";
    }
    @GetMapping("/quizzes")
    public String viewQuizzes(){
        answerService.deleteAll();
        return "quizzes";
    }
    @GetMapping("/quiz1/{id}")
    public String showQuestion(@PathVariable int id, Model model){
        model.addAttribute("QuestionID", id);
        return "quiz1q1";
    }
    @GetMapping("/quiz1q1")
    public String showQ1(){
        sampleService.setServer(1);
        return "quiz1q1";
    }
    @GetMapping("/quiz1q2")
    public String showQ2(){
        sampleService.setServer(2);
        return "quiz1q2";
    }
    @GetMapping("/quiz1q3")
    public String showQ3(){
        sampleService.setServer(3);
        return "quiz1q3";
    }


    @GetMapping("/sampleresponses")
    public String viewResponses(Model model){
        model.addAttribute("A", sampleService.countA());
        model.addAttribute("B", sampleService.countB());
        model.addAttribute("C", sampleService.countC());
        model.addAttribute("D", sampleService.countD());
        return "sampleresponses";
    }
    @RequestMapping(value = "/A", method = RequestMethod.POST)
    @ResponseBody
    public String postA(){
        sampleService.A();
        return "Done";
    }

    @RequestMapping(value = "/B", method = RequestMethod.POST)
    @ResponseBody
    public String postB(){
        sampleService.B();
        return "Done";
    }
    @RequestMapping(value = "/C", method = RequestMethod.POST)
    @ResponseBody
    public String postC(){
        sampleService.C();
        return "Done";
    }
    @RequestMapping(value = "/D", method = RequestMethod.POST)
    @ResponseBody
    public String postD(){
        sampleService.D();
        return "Done";
    }

    @GetMapping(value="/server")
    @ResponseBody
    public int getServer(){
        System.out.print(sampleService.getServer());
        return sampleService.getServer();

    }

    @GetMapping("/done")
    public String viewREALResponses(Model model){
        model.addAttribute("Q11", answerService.checkQn(1,1));
        model.addAttribute("Q12", answerService.checkQn(1,2));
        model.addAttribute("Q13", answerService.checkQn(1,3));
        model.addAttribute("Q14", answerService.checkQn(1,4));
        model.addAttribute("Q21", answerService.checkQn(2,1));
        model.addAttribute("Q22", answerService.checkQn(2,2));
        model.addAttribute("Q23", answerService.checkQn(2,3));
        model.addAttribute("Q24", answerService.checkQn(2,4));
        model.addAttribute("Q31", answerService.checkQn(3,1));
        model.addAttribute("Q32", answerService.checkQn(3,2));
        model.addAttribute("Q33", answerService.checkQn(3,3));
        model.addAttribute("Q34", answerService.checkQn(3,4));
        sampleService.setServer(0);
        return "end";
}
}




