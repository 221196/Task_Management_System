package com.task.commandLine;

import com.task.dao.RoleRepository;
import com.task.dao.UserRepository;
import com.task.model.Role;
import com.task.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class UserCommandLine implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;


    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public void run(String... args) throws Exception {
       User user = userRepository.findByEmail("charmi@gmail.com");
       Role role = roleRepository.findByName("Admin");
       if(user == null){
           User user1 = new User();
           user1.setRole(role);
           user1.setUserName("Charmi");
           user1.setEmail("charmi@gmail.com");
           user1.setPassword(passwordEncoder.encode("password"));
           userRepository.save(user1);
       }
    }
}
