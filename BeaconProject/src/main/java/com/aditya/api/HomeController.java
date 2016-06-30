package com.aditya.api;


import java.util.List;

import javax.mail.MessagingException;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
//import org.hibernate.classic.Session;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.beacon.dao.PatientDao;
import com.beacon.dao.UserDetails;
import com.beacon.dao.UserRoles;
import com.beacon.dao.Users;
import com.hibernate.util.HibernateUtil;

@RestController
public class HomeController {
	
	private static final Logger log= Logger.getLogger(HomeController.class.getName());
	
	@Autowired
	private SMTPMailSender javaMailSender;
	
	@Autowired
	public PatientDao patientDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET )
	public ModelAndView defaultPage(){
		log.info("Patient Successfully logged in");
		return new ModelAndView("patient");
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET )
	public ModelAndView adminPage(){
		log.info("Admin successfully logged in");
		return new ModelAndView("admin_test");
	}
	
	@RequestMapping(value = "/patients", method = RequestMethod.GET )
	public List<UserDetails> getAllPatients(){
		log.info("Retrieving all patients");
		return patientDao.getAllPatients();
	}
	
	@RequestMapping(value = "/patient/{userName}", method = RequestMethod.GET )
	public UserDetails getPatient(@PathVariable("userName") String userName){ 
		log.info("Retrieving patient with user name " + userName);
		return patientDao.getPatientDetails(userName);
	}
	
	@RequestMapping(value = "/patients/{userName}", method = RequestMethod.DELETE )
	public void deletePatient(@PathVariable("userName") String userName){ 
		
		patientDao.deletePatient(userName);
		log.info("Deleted patient with user name " + userName);
		
		}
	
	
	@RequestMapping(value = "/patients", method = RequestMethod.POST )
	public void addPatient(@RequestBody() UserDetails userDetails){ 
		String body = "Login with the following credentials. Username:" + userDetails.getUserName() +
				" Password: " + userDetails.getPassword();
	try {
		javaMailSender.send(userDetails.getEmail(), "Registration Successful", body);
	} catch (MessagingException e) {
		e.printStackTrace();
	}
		
		patientDao.save(userDetails);
		log.info("Patient is successfully created");
		
		
	}
	
	@RequestMapping(value = "/patients/{userName}", method = RequestMethod.PUT )
	public void editPatient(@RequestBody() UserDetails userDetails, @PathVariable("userName") String userName){ 
		
		patientDao.updatePatient(userDetails);
		log.info("Patient is successfully updated");
		
		}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage() {
        return new ModelAndView("login");
    }
	
	 @RequestMapping(value="/logout", method = RequestMethod.GET)
	    public String logoutPage(){
	        
	        return "redirect:/login?logout";
	    }
	
	 @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	    public ModelAndView accessDeniedPage() {   
	        return new ModelAndView("accessDenied");
	    }
	 
	/*@RequestMapping(value = "/patientDetails", method = RequestMethod.GET )
	public ModelAndView patientDetailsPage(){
		log.info("Retrieving admin page");
		return new ModelAndView("patient");
	}*/

	
}
