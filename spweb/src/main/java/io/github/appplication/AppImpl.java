package io.github.appplication;

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
    }
}
