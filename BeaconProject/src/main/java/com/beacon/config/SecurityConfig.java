package com.beacon.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {	
	  auth.jdbcAuthentication().dataSource(dataSource).
	  usersByUsernameQuery("select username , password, enable  from users where username = ?")
	  .authoritiesByUsernameQuery("select username , role  from user_roles where username = ?");
	  
	}
	
	/*public void configure(WebSecurity web) throws Exception {
	    
		web.ignoring().antMatchers("/static/**");
	
	}*/
	
	
	@Override
	protected void configure(HttpSecurity security) throws Exception{
		
		
		
		security.authorizeRequests().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')").
		antMatchers("/patients/**").access("hasRole('ROLE_ADMIN')").
		antMatchers("/").access("hasRole('ROLE_USER')").
		antMatchers("/patient/**").access("hasRole('ROLE_USER')").and()
		/*.antMatchers("/**").access("hasRole('ROLE_ADMIN')")
		and()*/
		.formLogin().loginPage("/login")
		.usernameParameter("username").passwordParameter("password").
		and().
		logout().logoutSuccessUrl("/login?logout").
		and().
		csrf().and().exceptionHandling().accessDeniedPage("/Access_Denied");;
	}
	

}
