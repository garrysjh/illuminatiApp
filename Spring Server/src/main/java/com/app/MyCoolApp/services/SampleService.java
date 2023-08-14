package com.app.MyCoolApp.services;

import com.app.MyCoolApp.repository.SampleAnswerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SampleService {
public static int Server = 0;

    @Autowired
    SampleAnswerRepository sampleAnswerRepository;
    public int countA(){
        return sampleAnswerRepository.countA();
    }
    public int countB(){
        return sampleAnswerRepository.countB();
    }
    public int countC(){
        return sampleAnswerRepository.countC();
    }
    public int countD(){
        return sampleAnswerRepository.countD();
    }
    public void A(){
        sampleAnswerRepository.A();
    }
    public void B(){
        sampleAnswerRepository.B();
    }
    public void C(){
        sampleAnswerRepository.C();
    }
    public void D(){
        sampleAnswerRepository.D();
    }

    public void setServer(int num){
        Server = num;
    }
    public int getServer(){
        return Server;
    }
}
