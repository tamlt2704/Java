package io.github.appplication;

import io.github.appplication.model.Employee;
import io.github.appplication.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class AppImpl implements CommandLineRunner {
    private final EmployeeRepository employeeRepository;

    @Autowired
    public AppImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        System.out.println("Application running...");
        this.employeeRepository.save(new Employee("Frodo", "Baggins", "ring bearer"));
        this.employeeRepository.save(new Employee("Bilbo", "Baggins", "burglar"));
        this.employeeRepository.save(new Employee("Gandalf", "the Grey", "wizard"));
        this.employeeRepository.save(new Employee("Samwise", "Gamgee", "gardener"));
        this.employeeRepository.save(new Employee("Meriadoc", "Brandybuck", "pony rider"));
        this.employeeRepository.save(new Employee("Peregrin", "Took", "pipe smoker"));
    }
}
