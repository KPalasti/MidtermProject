package com.skilldistillery.audiophile.data;

import java.util.List;

import com.skilldistillery.audiophile.entities.AlbumRating;

public interface AlbumRatingDAO {
	AlbumRating findById(int id);
	AlbumRating findByAlbumAndUserId(int albumId, int userId);
	
	boolean updateRating(int id, int newRating);
	boolean updateDescription(int id, String newRating);
	
	AlbumRating createAlbumRating(AlbumRating albumRating);
	boolean deleteAlbumRating(int id);
	
	List<AlbumRating> sortedByRating(int albumId, boolean ascendingOrder);
	List<AlbumRating> sortedByRating(int albumId, boolean ascendingOrder, int numberOfEntriesToShow);
	
	List<AlbumRating> sortedByCreatationDate(int albumId, boolean ascendingOrder);
	List<AlbumRating> sortedByCreationDate(int albumId, boolean ascendingOrder, int numberOfEntriesToShow);

	Double getAverageAlbumRating(int albumId);
}
