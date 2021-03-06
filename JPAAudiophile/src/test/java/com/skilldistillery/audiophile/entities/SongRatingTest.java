package com.skilldistillery.audiophile.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class SongRatingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private SongRating songrating;

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
		songrating = em.find(SongRating.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		songrating =null;
	}

	@Test
	void test() {
		assertNotNull(songrating);
		assertEquals("nice one", songrating.getDescription());
		assertEquals(3, songrating.getRatingDate().getDayOfMonth());
		assertEquals(3, songrating.getRating());
		assertEquals("Door Number Three", songrating.getSong().getName());
		assertEquals("admin@gmail.com", songrating.getUser().getEmail());
	}

}
