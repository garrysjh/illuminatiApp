package com.app.MyCoolApp.controllers;

import com.app.MyCoolApp.models.User;
import com.app.MyCoolApp.services.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@RestController
@RequestMapping("/api/v1")
public class UserApiController {

    @Autowired
    UserService userService;

    @GetMapping("/test")
    public String testEndpoint() {
        return "Test end point is working";
    }
    //Section for registering

    //    @PostMapping("/user/register")
//    public ResponseEntity registerNewUser(@RequestParam("username")String username,
//                                          @RequestParam("password")String password,
//                                          @RequestParam("firstname")String firstname,
//                                          @RequestParam("lastname")String lastname,
//                                          @RequestParam("mobile")String mobile){
//
//        if(firstname.isEmpty() || lastname.isEmpty() || username.isEmpty() || password.isEmpty() || mobile.isEmpty()){
//            return new ResponseEntity<>("Please complete all fields", HttpStatus.BAD_REQUEST);
//        }
//        //Register New User:
//        int result = userService.registerNewUserServiceCall(username, password, firstname, lastname, mobile);
//
//        if(result!=1){
//            return new ResponseEntity<>("Failed to register", HttpStatus.BAD_REQUEST);
//        }
//        return new ResponseEntity("User registered successfully", HttpStatus.OK);
//    }
    @RequestMapping(value = "/user/register", method = RequestMethod.POST, consumes = {"application/json"}, produces = {"application/json"})
    @ResponseBody
    public String registerUser(@RequestBody User user) {
        if (user == null) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("status", "error");
            jsonObject.put("message", "User is null");
            return jsonObject.toString();
        }
        //check username
        else if (userService.checkExistingUsername(user.getUsername()) > 0) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("status", "error");
            jsonObject.put("message", "Username already exists!");
            return "Email already exists!";


        }
        //check email
        else if (userService.checkExistingMobile(user.getMobile()) > 0) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("status", "error");
            jsonObject.put("message", "Mobile already exists!");
            return "Mobile already exists!";

        } else {
            userService.registerUser(user);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("status", "success");
            jsonObject.put("message", "User registered successfully");
            return "User registered successfully!";

        }
    }

    @RequestMapping(value = "/user/login", method = RequestMethod.POST, consumes = {"application/json"})
    @ResponseBody
    public int login(@RequestBody User user){
        return userService.login(user.getUsername(), user.getPassword());
    }

    @RequestMapping(value = "/user/verify", method = RequestMethod.POST)
    @ResponseBody
    public String checkName(@RequestBody User user){
        return userService.getFirstName(user.getId());
    }
}
