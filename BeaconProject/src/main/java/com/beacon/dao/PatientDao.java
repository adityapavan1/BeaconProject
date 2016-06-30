package com.beacon.dao;

import java.util.List;

public interface PatientDao {

	/*public int updateUser(String userName, String firstName,String lastName);
	public int deleteUser(String userName);
	public int save(Users users);*/
	
	public boolean save(UserDetails userDetails);
	
	public List<UserDetails> getAllPatients();
	
	public UserDetails getPatientDetails(String userName);
	
	public boolean deletePatient(String username);
	
	public boolean updatePatient(UserDetails userDetails);
	
}
