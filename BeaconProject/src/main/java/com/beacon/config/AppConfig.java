package com.beacon.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;





import com.beacon.dao.PatientDao;
import com.beacon.dao.PatientDaoImpl;
import com.beacon.dao.UserDetails;
import com.beacon.dao.UserRoles;
import com.beacon.dao.Users;

@EnableWebMvc
@Configuration
@ComponentScan("com.aditya.api")
@Import({SecurityConfig.class})
@EnableTransactionManagement
public class AppConfig extends WebMvcConfigurerAdapter{
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/");
        registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
    }
	 
	@Bean
	public JavaMailSenderImpl javaMailSenderImpl(){
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		
		mailSender.setUsername("pavanaditya473@gmail.com");
		mailSender.setPassword("Adiphajaya1@");
		Properties prop = mailSender.getJavaMailProperties();
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.debug", "true");
		return mailSender;
	}
	
	
	
	@Bean(name = "dataSource")
	public DriverManagerDataSource dataSource() {
	    DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
	    driverManagerDataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
	    driverManagerDataSource.setUrl("jdbc:oracle:thin:@localhost:1523/orcl2");
	    //driverManagerDataSource.setUrl("jdbc:oracle:thin:@valivesn.ctkxdh4ihdvt.us-east-1.rds.amazonaws.com:1521/orcl");
	    driverManagerDataSource.setUsername("aditya");
	    driverManagerDataSource.setPassword("Cogent123");
	    return driverManagerDataSource;
	}
	
	@Bean
	public InternalResourceViewResolver viewresolver(){
		
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Autowired
	@Bean(name="patientDao")
	public PatientDao getUserDao(SessionFactory sessionFactory){
		return new PatientDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name="transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager manager = new HibernateTransactionManager(sessionFactory);
		
		return manager;
		
	}
	
	private Properties getHibernateProperties(){
		Properties properties = new Properties();
		properties.put("hibernate.dialect", "org.hibernate.dialect.OracleDialect");
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
		
	}
	
	@Bean(name="dataSource")
	public DataSource getDataSource(){
		BasicDataSource b = new BasicDataSource();
		b.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		b.setUrl("jdbc:oracle:thin:@localhost:1523/orcl2");
		b.setUsername("aditya");
		b.setPassword("Cogent123");
		
		return b;
	}
	
	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource){
		
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		
		sessionBuilder.addAnnotatedClass(Users.class);
		sessionBuilder.addAnnotatedClass(UserRoles.class);
		sessionBuilder.addAnnotatedClass(UserDetails.class);
		sessionBuilder.addProperties(getHibernateProperties());
		return sessionBuilder.buildSessionFactory();
	}
	
	
	
}
