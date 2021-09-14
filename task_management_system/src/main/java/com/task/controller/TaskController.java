package com.task.controller;

import com.task.dao.TaskRepository;
import com.task.dao.UserRepository;
import com.task.model.Task;
import com.task.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
public class TaskController {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String home(){
        return "home";
    }

    @GetMapping("/tasks")
    public String listTasks(Model model, Principal principal){
        String email = principal.getName();
        User user = userRepository.findByEmail(email);

        if (user.getRole().getName().equals("Admin")) {
            model.addAttribute("tasks", taskRepository.findAll());
            return "task/taskList";
        }
        else
        {
            model.addAttribute("tasks", user.getTasks());
            return "task/userTask";
        }
    }

    @GetMapping("/tasks/new")
    public String taskForm(Model model){
        model.addAttribute("users", userRepository.findAll());
        return "task/new";
    }

    @GetMapping("/tasks/{id}/edit")
    public String editTaskForm(Model model, @PathVariable("id")int id){
        Task task = taskRepository.findById(id).orElse(null);
        model.addAttribute("task", task);
        return "task/edit";
    }

    @PostMapping("/tasks/{id}")
    public String updateTask(@PathVariable("id")int id, @RequestParam("name")String name, @RequestParam("description")String description, @RequestParam("start_date")String start_date, @RequestParam("end_date")String end_date){
        Task task = taskRepository.findById(id).orElse(null);
        task.setName(name);
        task.setDescription(description);
        task.setStart_date(start_date);
        task.setEnd_date(end_date);
        taskRepository.save(task);
        return "redirect:/tasks";
    }

    @PostMapping("/tasks/save")
    public String taskSave(@RequestParam("name")String name, @RequestParam("description")String description, @RequestParam("start_date")String start_date, @RequestParam("end_date")String end_date, @RequestParam("user_id")int user_id){
       User user = userRepository.findById(user_id).orElse(null);

        Task task = new Task();
        task.setName(name);
        task.setDescription(description);
        task.setStart_date(start_date);
        task.setEnd_date(end_date);
        task.setStatus("started");
        task.setUser(user);
        taskRepository.save(task);
        return "redirect:/tasks";
    }

    @GetMapping("/tasks/{id}/delete")
    public String deleteTask(@PathVariable("id")int id){
        taskRepository.deleteById(id);
        return "redirect:/tasks";
    }

    @GetMapping("/complete/{id}")
    public String markComplete(@PathVariable("id")int id){
        Task task = taskRepository.findById(id).orElse(null);
        task.setStatus("completed");
        taskRepository.save(task);
        return "redirect:/tasks";
    }
}
