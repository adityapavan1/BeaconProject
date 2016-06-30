package com.aditya.api;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.beacon.dao.PatientDao;
import com.beacon.dao.PatientDaoImpl;
import com.beacon.dao.UserDetails;
import static org.mockito.Mockito.*;

public class PatientDaoImplTest {
	
	@Mock
	PatientDao pd;
	UserDetails userDetails;
	
	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void TestForCreatingNewPatient() {
		
		
				
		when(pd.save(userDetails)).thenReturn(true);
		
		boolean x = pd.save(userDetails);
		
		assertTrue(x);
		
		
	}
	

	@Test
	public void TestForDeletingPatient() {
		
		
		
		String userName = "aditya";
		
		when(pd.deletePatient(userName)).thenReturn(true);
		
		boolean x = pd.deletePatient(userName);;
		
		assertTrue(x);
		
		
		
	}
	
	@Test
	public void TestForUpdatingPatient() {
		
		
		
		
		when(pd.updatePatient(userDetails)).thenReturn(true);
		
		
		boolean x = pd.updatePatient(userDetails);
		
		assertTrue(x);
		
		
		
	}
	
	
	
	
	@After
	public void tearDown() throws Exception {
	}


}
