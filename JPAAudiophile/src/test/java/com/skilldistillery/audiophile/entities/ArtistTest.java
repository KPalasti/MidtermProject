package com.skilldistillery.audiophile.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ArtistTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Artist artist;
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf=Persistence.createEntityManagerFactory("JPAAudiophile");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		artist = em.find(Artist.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		artist =null;
	}


	@Test
	@DisplayName("test artist mapping")
	void test() {
		assertNotNull(artist);
		assertEquals("jimmy buffett", artist.getName());
		assertEquals(1, artist.getUser().getId());
		
	}
	
	@Test
	@DisplayName("test artist and song mapping")
	void test2() {
		assertNotNull(artist);
		assertNotNull(artist.getSongs());
		assertTrue(artist.getSongs().size() > 0);
	}
	
	@Test
	@DisplayName("test artist to user mapping")
	void test3(){
		assertNotNull(artist);
		assertNotNull(artist.getUser());
		assertEquals(1, artist.getUser().getId());
	}
	@Test
	@DisplayName("test artist for create date")
	void test4(){
		assertNotNull(artist);
		assertNotNull(artist.getUser());
		assertEquals(11, artist.getCreateDate().getDayOfMonth());
		assertEquals(8, artist.getCreateDate().getMonthValue());
		assertEquals(2019, artist.getCreateDate().getYear());
	}

}
