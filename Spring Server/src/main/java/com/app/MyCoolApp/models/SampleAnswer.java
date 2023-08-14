package com.app.MyCoolApp.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name="user")
@Data
public class SampleAnswer {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    public int id;
    @Column(name="answer")
    public int answer;

    public SampleAnswer(int id, int answer) {
        this.id = id;
        this.answer = answer;
    }

    public int getAnswer() {
        return answer;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }
}
