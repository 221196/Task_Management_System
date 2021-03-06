package com.task.dao;

import com.task.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository  extends JpaRepository<Task, Integer> {
    Task findByName(String name);
}
