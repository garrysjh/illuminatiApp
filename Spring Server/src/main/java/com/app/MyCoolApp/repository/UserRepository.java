package com.app.MyCoolApp.repository;

import com.app.MyCoolApp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    @Transactional
    @Modifying
    @Query(value= "INSERT INTO USER(username, password, firstname, lastname, mobile) VALUES(:username, :password, :firstname, :lastname, :mobile)", nativeQuery = true)
        int registerNewUser(@Param("username") String username,
                            @Param("password") String password,
                            @Param("firstname") String firstname,
                            @Param("lastname") String lastname,
                            @Param("mobile") String mobile);

    @Query(value = "select count(username) from user where username=:username", nativeQuery = true)
    int checkExistingUsername(String username);

    @Query(value = "select count(mobile) from user where mobile=:mobile", nativeQuery = true)
    int checkExistingMobile(String mobile);

    @Query(value = "select password from user where username=:username", nativeQuery = true)
    String checkPassOfUser(String username);

    @Query(value = "select id from user where username=:username", nativeQuery = true)
    int getidOfUser(String username);

    @Query(value = "select firstname from user where id=:id", nativeQuery = true)
    String getFirstnameFromId(int id);

    @Query(value = "select lastname from user where id=:id", nativeQuery = true)
    String getLastnameFromId(int id);

    @Query(value = "select lastname from user where id=:id", nativeQuery = true)
    String getMobileFromId(int id);
}

