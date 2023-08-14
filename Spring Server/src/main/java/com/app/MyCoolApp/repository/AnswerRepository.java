package com.app.MyCoolApp.repository;

import com.app.MyCoolApp.models.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Repository
public interface AnswerRepository extends JpaRepository<Answer, Integer> {
//    @Transactional
//    @Modifying
//    @Query(value = "insert into Answer", nativeQuery = true)
//    int C();

    @Query(value = "select count(*) from answer where question_id=1 and answer=:answer", nativeQuery = true)
    int checkQn1(int answer);

    @Query(value = "select count(*) from answer where question_id=2 and answer=:answer", nativeQuery = true)
    int checkQn2(int answer);

    @Query(value = "select count(*) from answer where question_id=:question and answer=:answer", nativeQuery = true)
    int checkQn(int question, int answer);

}
