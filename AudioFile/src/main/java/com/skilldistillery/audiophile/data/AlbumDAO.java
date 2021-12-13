package com.skilldistillery.audiophile.data;

import java.time.LocalDateTime;
import java.util.List;

import com.skilldistillery.audiophile.entities.Album;
import com.skilldistillery.audiophile.entities.Artist;
import com.skilldistillery.audiophile.entities.Genre;
import com.skilldistillery.audiophile.entities.Song;
import com.skilldistillery.audiophile.entities.User;

public interface AlbumDAO {
	
	/*
	 * ----------------------------------------------------------------------------
	 * Search Functions
	 * ----------------------------------------------------------------------------
	 */
	
	Album findAlbumById(int id);
	Album findAlbumByTitle(String albumTitle);
	Album findAlbumBySongTitle(String songName);
	List<Album> findAlbumsByArtistName(String artistName);
	List<Album> findAlbumByCreationDate(LocalDateTime creationDate);
	List<Album> findAlbumsByGenre(String genre);
	List<Album> findAlbumsByCreatedUsername(String username);
	List<Song> getSongsFromAlbum(Album album);
	
	/*
	 * ----------------------------------------------------------------------------
	 * Sort Functions
	 * ----------------------------------------------------------------------------
	 */
	
	List<Album> sortAlbumsByRating();
	List<Album> sortAlbumsByCreateDate();
	
	
	
	
	
	/*
	 * ----------------------------------------------------------------------------
	 * CRUD album functions
	 * ----------------------------------------------------------------------------
	 */
	
	boolean addAlbum(Album album);
	boolean updateAlbum(int id, Album album);
	boolean deleteAlbum(Album album);
	
	

}
