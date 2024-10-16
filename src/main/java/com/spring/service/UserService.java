package com.spring.service;

import com.spring.entity.User;

public interface UserService {

    void join(User user);

    boolean login(User user);

    User getUserByUserId(String userId);
    
    boolean isUserIdExists(String userId);

}


