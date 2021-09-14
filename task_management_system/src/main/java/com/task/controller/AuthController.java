package com.task.controller;

import com.sendgrid.*;
import com.task.dao.RoleRepository;
import com.task.dao.UserRepository;
import com.task.model.Role;
import com.task.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private RoleRepository roleRepository;

    @GetMapping("/users/sign_up")
    public String RegisterForm(Model model){
       model.addAttribute("user", new User());
       return "register";
    }

    @PostMapping("/users/save")
    public String saveUser(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("email") String email)
    {
        Role role = roleRepository.findByName("User");
        User user = new User();
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(password));
        user.setUserName(username);
        user.setRole(role);
        userRepository.save(user);
        sendEmail(user);
        return "redirect:/login";
    }

    public void sendEmail(User user){
        Email from = new Email("gopalakrishnankishore510@gmail.com");
        String subject = "Welcome" + user.getUserName();
        Email to = new Email(user.getEmail());
        Content content = new Content("text/html", default_email_template(user.getUserName()));
        Mail mail = new Mail(from, subject, to, content);
        SendGrid sg = new SendGrid("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");
        Request request = new Request();

        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());
            Response response = sg.api(request);
        } catch (IOException ex) {
            System.out.println(ex);
        }

    }

    public String default_email_template(String username) {
        String html_content = "<html><body>Hi " + username + "<br>Your are just joined our task manager, we will provide you a best experience.</body></html>";
        return html_content;
    }


    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
}
