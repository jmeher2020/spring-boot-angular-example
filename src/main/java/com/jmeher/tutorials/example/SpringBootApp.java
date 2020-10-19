package com.jmeher.tutorials.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan(basePackages = {"com.jmeher.tutorials.example.*"})
public class SpringBootApp 
{
	public static void main( String[] args )
	{
		System.out.println("STARTING: JMEHER TUTORIALS SPRING BOOT");
		SpringApplication.run(SpringBootApp.class, args);
		System.out.println("SUCCESSFULLY STARTED: JMEHER TUTORIALS SPRING BOOT");
	}
}
