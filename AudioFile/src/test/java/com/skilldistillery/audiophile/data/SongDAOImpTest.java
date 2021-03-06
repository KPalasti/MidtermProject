package com.skilldistillery.audiophile.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.audiophile.entities.Song;

@SpringBootTest
class SongDAOImpTest {

	@Autowired
	SongDAOImpl DaoImp;

	@Test
	void test_findById() {
		assertNotNull(DaoImp.findById(2));
		assertEquals(DaoImp.findById(2).getName(), "Door Number Three");

	}

	@Test
	void test_findBySongName() {
		assertNotNull(DaoImp.findBySongName("Dallas"));
		assertEquals(DaoImp.findBySongName("Dallas").get(0).getName(), "Dallas");

	}

	@Test
	void test_sortByCreatDate() {
		assertNotNull(DaoImp.sortByCreatDate());
		assertFalse(DaoImp.sortByCreatDate().isEmpty());
	}

	@Test
	void test_sortByUpdateTime() {
		assertNotNull(DaoImp.sortByUpdateTime());
		assertFalse(DaoImp.sortByUpdateTime().isEmpty());
	}

	@Test

	void test_for_find_by_Artist_Name() {

		assertNotNull(DaoImp.findByArtistName("Adele"));
//		assertEquals("Adele",DaoImp.findByArtistName("Adele").get(1).getArtists().get(1).getName());
	}
	void test_findByArtistName() {
		assertNotNull(DaoImp.findByArtistName("jimmy buffett"));
		assertTrue(DaoImp.findByArtistName("jimmy buffett").size() > 0);

	}

	@Test
	void test_findByAlbumName() {
		assertNotNull(DaoImp.findByAlbumName("A1A"));
		assertEquals(DaoImp.findByAlbumName("A1A").get(0).getName(), "Making Music for Money");

	}

	@Test
	void test_findSongByRating() {
		assertNotNull(DaoImp.findSongsByRating(3));
		assertFalse(DaoImp.findSongsByRating(3).isEmpty());
	}

	@Test
	void test_sortBySongRating() {
		List<Song> s = DaoImp.sortBySongRatingAndReturnLimitedNumber(false, 3);
		assertNotNull(s);
		assertTrue(DaoImp.sortBySongRatingAndReturnLimitedNumber(false, 3).size() > 0);
	}

	@Test
	void test_findByLyricsKeyword() {
		assertNotNull(DaoImp.findByLyricsKeyword("you"));
		assertFalse(DaoImp.findByLyricsKeyword("you").isEmpty());

	}
	
	@Test
	void test_sortSongsByRating() {
		List<Song> s = DaoImp.sortSongsByRating(false);
		assertNotNull(s);
		assertTrue(s.size() > 0);
	}
	
	@Test
	void test_sortByName() {
		List<Song> songs = DaoImp.sortByName(true);
		assertNotNull(songs);
		assertTrue(songs.size() > 0);
//		assertEquals(songs.get(0).getName(),"A Pirate Looks at Forty");
	}
	

}
