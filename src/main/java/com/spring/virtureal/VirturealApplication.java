package com.spring.virtureal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages = "com.spring")
@EnableJpaRepositories(basePackages = "com.spring.repository")
@EntityScan(basePackages = "com.spring.entity")
public class VirturealApplication {

	public static void main(String[] args) {
		SpringApplication.run(VirturealApplication.class, args);
	}

}
