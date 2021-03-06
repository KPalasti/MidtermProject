package com.skilldistillery.audiophile.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
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

class AlbumTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Album album;
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
		album = em.find(Album.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		album =null;
	}

	@Test
	void test_AlbumTitle_basic_mappings() {
		assertNotNull(album);
		assertEquals("A1A", album.getTitle());
	}
	@Test
	void test_AlbumDescription_basic_mappings() {
		assertNotNull(album);
		assertTrue(album.getDescription().contains("A1A"));
	}
	
	@Test
	void test_AlbumReleaseDate_basic_mappings() {
		assertNotNull(album);
		assertEquals(1974, album.getReleaseDate().getYear());
		assertEquals(12, album.getReleaseDate().getMonthValue());
		assertEquals(01, album.getReleaseDate().getDayOfMonth());
	}
	
	@Test
	void test_AlbumImageURL_basic_mappings() {
		assertNotNull(album);
		assertTrue(album.getImageURL().contains("upload.wikimedia.org"));
	}
	
	@Test
	void test_UserId_basic_mappings() {
		assertNotNull(album);
		assertEquals(1, album.getUser().getId());
	}
	
	@Test
	void test_favoritedBy_mapping() {
		assertNotNull(album);
		assertNotNull(album.getFavoritedBy());
		
		assertFalse(album.getFavoritedBy().isEmpty());
		assertEquals(1,album.getFavoritedBy().get(0).getId());
		assertEquals("admin",album.getFavoritedBy().get(0).getUsername());
	}
	
	@Test
	void test_AlbumRating_to_Album_mapping() {
		assertNotNull(album);
		assertNotNull(album.getAlbumRatings());
		
		assertFalse(album.getAlbumRatings().isEmpty());
		assertEquals(3,album.getAlbumRatings().get(0).getRating());
		assertEquals("nice album",album.getAlbumRatings().get(0).getDescription());
	}
	
	@Test
	@DisplayName("test album to genre mapping")
	void test2() {
		assertNotNull(album);
		assertNotNull(album.getGenres());
		assertEquals("country", album.getGenres().get(0).getName());
	}
	
	@Test
	void test_CreationDateTime_mapping() {
		assertNotNull(album);
		assertNotNull(album.getCreationDateTime());

		assertEquals(2019, album.getCreationDateTime().getYear());
		assertEquals(8, album.getCreationDateTime().getMonthValue());
		assertEquals(30, album.getCreationDateTime().getDayOfMonth());
	}
	@Test
	void test_Get_AlbumComment() {
		assertNotNull(album);
		assertNotNull(album.getAlbumComments());
		assertTrue(album.getAlbumComments().size() > 0);
	}
	
	@Test
	@DisplayName("test album to songs mapping")
	void test21() {
		assertNotNull(album);
		assertTrue(album.getSongs().size() > 0);
	}
}