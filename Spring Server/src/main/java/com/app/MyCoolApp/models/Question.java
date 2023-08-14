package com.app.MyCoolApp.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name="Question")
@Data
public class Question {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="questiondesc")
    private String questiondesc;

    @Column(name="actualanswer")
    private int actualanswer;

    @Column(name="quiz_id")
    private int quid_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestiondesc() {
        return questiondesc;
    }

    public void setQuestiondesc(String questiondesc) {
        this.questiondesc = questiondesc;
    }

    public int getActualanswer() {
        return actualanswer;
    }

    public void setActualanswer(int actualanswer) {
        this.actualanswer = actualanswer;
    }

    public int getQuid_id() {
        return quid_id;
    }

    public void setQuid_id(int quid_id) {
        this.quid_id = quid_id;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Column(name="time")
    private int time;

}
