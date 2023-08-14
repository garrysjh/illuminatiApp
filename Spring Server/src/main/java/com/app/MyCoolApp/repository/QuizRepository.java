package com.app.MyCoolApp.repository;

import com.app.MyCoolApp.models.Quiz;
import com.app.MyCoolApp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Integer>{
    @Query(value = "select * from Quiz", nativeQuery = true)
    Map<String, ?> showQuizzes();
}
