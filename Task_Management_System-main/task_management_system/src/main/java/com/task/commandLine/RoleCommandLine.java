package com.task.commandLine;

import com.task.dao.RoleRepository;
import com.task.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class RoleCommandLine  implements CommandLineRunner {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public void run(String... args) throws Exception {
        Role check_admin = roleRepository.findByName("Admin");
        if (check_admin == null) {
            Role admin = new Role();
            admin.setName("Admin");
            roleRepository.save(admin);
        }

        Role check_student = roleRepository.findByName("User");
        if (check_student == null) {
            Role student = new Role();
            student.setName("User");
            roleRepository.save(student);
        }

    }
}
