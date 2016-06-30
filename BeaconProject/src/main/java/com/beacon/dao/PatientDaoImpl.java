package com.beacon.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class PatientDaoImpl implements PatientDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public PatientDaoImpl() {
		
	}
	
	public PatientDaoImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	@Transactional
	public List<UserDetails> getAllPatients() {
		@SuppressWarnings("unchecked")
		List<UserDetails> list = (List<UserDetails>) sessionFactory.getCurrentSession().
				createCriteria(UserDetails.class).
				setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return list;
	}


	@Override
	@Transactional
	public boolean save(UserDetails userDetails) {
		
		Users users = new Users();
		users.setUsername(userDetails.getUserName());
		users.setPassword(userDetails.getPassword());
		users.setEnable(1);
		
		UserRoles userRoles = new UserRoles();
		userRoles.setRole("ROLE_USER");
		userRoles.setUsers(users);
		
		try{
		sessionFactory.getCurrentSession().save(userDetails);
		sessionFactory.getCurrentSession().save(users);
		sessionFactory.getCurrentSession().save(userRoles);
		}
		catch(Exception e){
			return false;
		}
		
		return true;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public UserDetails getPatientDetails(String userName) {
		String hql = "from UserDetails where userName = '" + userName +"'";
		System.out.println(hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<UserDetails> list = (List<UserDetails>)query.list();
		if(list!=null && !list.isEmpty()){
			return list.get(0);
		}
		return null;
	}

	@Override
	@Transactional
	public boolean deletePatient(String userName) {
		 try{
		 Criteria crit = sessionFactory.getCurrentSession().createCriteria(Users.class);
		 crit.add(Restrictions.eq("username",userName));
		 Users users = (Users)crit.uniqueResult();
		 sessionFactory.getCurrentSession().delete(users);
		 }
		 catch(Exception e){
			 return false;
		 }
		 
		 return true;
		 }

	@Override
	@Transactional
	public boolean updatePatient(UserDetails userDetails) {
		try{
		sessionFactory.getCurrentSession().update(userDetails);
		}
		catch(Exception e){
			return false;
		}
		
		return true;
	}
	
	
	

}
