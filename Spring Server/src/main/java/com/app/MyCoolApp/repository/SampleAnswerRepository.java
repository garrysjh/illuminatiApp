package com.app.MyCoolApp.repository;
import com.app.MyCoolApp.models.SampleAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public interface SampleAnswerRepository extends JpaRepository<SampleAnswer, Integer> {
    @Query(value = "select count(ANSWER) from sampleAnswer where answer=1", nativeQuery = true)
    int countA();
    @Query(value = "select count(ANSWER) from sampleAnswer where answer=2", nativeQuery = true)
    int countB();
    @Query(value = "select count(ANSWER) from sampleAnswer where answer=3", nativeQuery = true)
    int countC();
    @Query(value = "select count(ANSWER) from sampleAnswer where answer=4", nativeQuery = true)
    int countD();
    @Transactional
    @Modifying
    @Query(value = "insert into sampleAnswer values(1)", nativeQuery = true)
    int A();
    @Transactional
    @Modifying
    @Query(value = "insert into sampleAnswer values(2)", nativeQuery = true)
    int B();
    @Transactional
    @Modifying
    @Query(value = "insert into sampleAnswer values(3)", nativeQuery = true)
    int C();
    @Transactional
    @Modifying
    @Query(value = "insert into sampleAnswer values(4)", nativeQuery = true)
    int D();
}
