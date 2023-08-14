package com.app.MyCoolApp.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name="Quiz")
@Data
public class Quiz {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="quiztitle")
    private String quiztitle;

    @Column(name="quizdesc")
    private String quizdesc;

    @Column(name="creator_id")
    private String creator_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuiztitle() {
        return quiztitle;
    }

    public void setQuiztitle(String quiztitle) {
        this.quiztitle = quiztitle;
    }

    public String getQuizdesc() {
        return quizdesc;
    }

    public void setQuizdesc(String quizdesc) {
        this.quizdesc = quizdesc;
    }

    public String getCreator_id() {
        return creator_id;
    }

    public void setCreator_id(String creator_id) {
        this.creator_id = creator_id;
    }

    @Override
    public String toString() {
        return "Quiz{" +
                "id=" + id +
                ", quiztitle='" + quiztitle + '\'' +
                ", quizdesc='" + quizdesc + '\'' +
                ", creator_id='" + creator_id + '\'' +
                '}';
    }
}
