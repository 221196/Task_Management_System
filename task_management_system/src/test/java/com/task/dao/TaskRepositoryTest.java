package com.task.dao;

import com.task.model.Task;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


@ContextConfiguration(classes = {TaskRepository.class})
@DataJpaTest
@EnableAutoConfiguration(exclude = {DataSourceAutoConfiguration.class})
@ComponentScan(basePackages = {"com.task"})
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class NoteRepositoryTests {

    @Autowired
    private TaskRepository taskRepository;


    @Test
    @Rollback(false)
    @Order(1)
    public void testSaveNewNote() {

        Task task = new Task();
        task.setName("test one");
        taskRepository.save(task);
        assertThat(task.getName()).isEqualTo("test one");
    }

    @Test
    @Order(2)
    public void testListNote() {
        List<Task> noteList = taskRepository.findAll();
        assertThat(noteList).size().isGreaterThan(0);
    }

    @Test
    @Rollback(false)
    @Order(3)
    public void testUpdateNote() {

        Task task = taskRepository.findByName("test one");
        task.setDescription("test description");
        taskRepository.save(task);

        assertThat(task.getDescription()).isEqualTo("test description");
    }

    @Test
    @Rollback(false)
    @Order(4)
    public void testDeleteNote() {

        Task task = taskRepository.findByName("test one");

        taskRepository.deleteById(task.getId());

        Task task1 = taskRepository.findByName("test one");

        assertThat(task1).isNull();

    }
}
