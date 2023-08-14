package com.app.MyCoolApp.services;

import com.app.MyCoolApp.models.User;
import com.app.MyCoolApp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public int registerNewUserServiceCall(String username, String password, String firstname, String lastname, String mobile){
        return userRepository.registerNewUser(username,password,firstname,lastname,mobile);

    }

    public void registerUser(User user){
        userRepository.save(user);
    }
    public int checkExistingUsername(String username){return userRepository.checkExistingUsername(username); }

    public int checkExistingMobile(String mobile){return userRepository.checkExistingMobile(mobile); }


    public int login(String username, String password){
        if(Objects.equals(password, userRepository.checkPassOfUser(username))){
            return userRepository.getidOfUser(username);
        }
        else{
            return 0;
        }
    }
    public String getFirstName(int id){
        return userRepository.getFirstnameFromId(id);
    }



}
