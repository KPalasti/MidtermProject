package com.skilldistillery.audiophile.data;

import java.util.List;

import com.skilldistillery.audiophile.entities.Song;

public interface SongDAO {

	public Song findById(int id);
	public List<Song> findSongsByRating(int rating);
	public List<Song> findBySongName (String name);
	public List<Song> findByArtistName(String artistName);
	public List<Song> findByAlbumName(String albumName);
	public List<Song> findByLyricsKeyword(String keyword);
	public List<Song> sortByCreatDate();
	public List<Song> sortByName(boolean ascendingOrder);
	public List<Song> sortBySongRatingAndReturnLimitedNumber(boolean ascendingOder, int numberOf);
	public List<Song> sortByUpdateTime();
	public List<Song> sortSongsByRating(boolean ascendingOrder);
	
	
	//CRUD
	public Song addNewSong(Song song);
	public boolean updateSongName(int id, String newName);
	public boolean updateSongLyrics(int id, String newLyrics);
	public boolean updateSongDurationSeconds(int id, int newDurationSeconds);
	public boolean updateSong(int id, Song song);
	public boolean deleteNewAddedSong(int id);
}
