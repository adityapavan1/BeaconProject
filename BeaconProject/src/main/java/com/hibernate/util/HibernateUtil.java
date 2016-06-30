package com.hibernate.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;


public class HibernateUtil {
	
	private static final SessionFactory sessionFactory = buildSessionFactory();

	@SuppressWarnings("deprecation")
	private static SessionFactory buildSessionFactory() {
		try{
			return new AnnotationConfiguration().configure().buildSessionFactory();
		}	
		catch(Throwable ex){
			System.out.println("initial session factory creation failed" + ex);
			throw new ExceptionInInitializerError(ex);
		}
		
	}
	
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}

}