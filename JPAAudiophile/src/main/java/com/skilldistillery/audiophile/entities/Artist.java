package com.skilldistillery.audiophile.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Artist {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="update_time")
    @UpdateTimestamp
    private LocalDateTime updatedAt;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@Column(name="description")
	private String description;
	
	@Column(name="create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	
	@ManyToMany(cascade= CascadeType.PERSIST)
	@JoinTable(name="song_artist",
	  joinColumns=@JoinColumn(name="artist_id"),
	  inverseJoinColumns=@JoinColumn(name="song_id")
	)
	private List<Song> songs;
	
	@OneToMany(mappedBy = "artist")
	private List<Album> albums;
	
	/* ----------------------------------------------------------------------------
	    Constructors
---------------------------------------------------------------------------- */
	
	public Artist() {}
	
	/* ----------------------------------------------------------------------------
	get/set Id
---------------------------------------------------------------------------- */
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	/* ----------------------------------------------------------------------------
	get/set Name
---------------------------------------------------------------------------- */

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	/* ----------------------------------------------------------------------------
	get/set User
---------------------------------------------------------------------------- */

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	/* ----------------------------------------------------------------------------
	get/set ImageUrl
---------------------------------------------------------------------------- */

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	/* ----------------------------------------------------------------------------
	get/set Description
---------------------------------------------------------------------------- */

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	/* ----------------------------------------------------------------------------
	get/set Songs
---------------------------------------------------------------------------- */

	public List<Song> getSongs() {
		if (songs == null) {
			songs = new ArrayList<>();
		}
		
		return songs;
	}

	public void setSongs(List<Song> songs) {
		this.songs = songs;
	}
	
	public boolean addSong(Song song) {
		if (songs == null) {
			songs = new ArrayList<>();
		}
		
		boolean addedToList = false;
		if (song != null) {
			if (! songs.contains(song)) {
				addedToList = songs.add(song);
			}
			
			if (! song.getArtists().contains(this)) {
				song.getArtists().add(this);
			}
		}
		
		return addedToList;
	}
	public boolean removeSong(Song song) {
		boolean removed = false;
		if (songs != null && songs.contains(song)) {
			removed = songs.remove(song);
		}
		
		if (song.getArtists().contains(this)) {			
			song.removeArtist(this);
		}
		
		return removed;
	}
	/* ----------------------------------------------------------------------------
	get/set createDate
---------------------------------------------------------------------------- */

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	/* ----------------------------------------------------------------------------
	get/set albums
---------------------------------------------------------------------------- */

	public List<Album> getAlbums() {
		if (albums == null) {
			albums = new ArrayList<>();
		}
		
		return albums;
	}

	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}
	
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public boolean addAlbum(Album album) {
		if (albums == null) {
			albums = new ArrayList<>();
		}
		
		boolean addedToList = false;
		if (albums != null) {
			if (! albums.contains(album)) {
				addedToList = albums.add(album);
			}
			
			if (! album.getArtist().equals(this)) {
				album.setArtist(this);
			}
		}
		
		return addedToList;
	}
	public boolean removeAlbums(Album album) {
		boolean removed = false;
		if (albums != null && albums.contains(album)) {
			removed = albums.remove(album);
		}
		
		if (album.getArtist().equals(this)) {			
			album.setArtist(this);
		}
		
		return removed;
	}
	
	/* ----------------------------------------------------------------------------
	    misc
---------------------------------------------------------------------------- */

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Artist other = (Artist) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Artist [id=").append(id).append(", name=").append(name).append(", user=").append(user)
				.append(", createDate=").append(createDate).append("]");
		return builder.toString();
	}
	
	

}
