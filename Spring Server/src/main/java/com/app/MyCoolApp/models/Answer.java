package com.app.MyCoolApp.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table (name="answer")
@Data
public class Answer {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="question_id")
    private Integer question_id;

    @Column(name="user_id")
    private int user_id;

    public Answer(Integer id, Integer question_id, int user_id, int answer) {
        this.id = id;
        this.question_id = question_id;
        this.user_id = user_id;
        this.answer = answer;
    }

    public Answer() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Integer question_id) {
        this.question_id = question_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getAnswer() {
        return answer;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }

    @Column(name="answer")
    private int answer;
}
