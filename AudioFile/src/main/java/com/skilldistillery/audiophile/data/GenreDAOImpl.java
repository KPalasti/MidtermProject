package com.skilldistillery.audiophile.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.skilldistillery.audiophile.entities.Genre;

@Repository
@Transactional
@Service
public class GenreDAOImpl implements GenreDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Genre findGenreById(int id) {
		return em.find(Genre.class, id);
	}

	@Override
	public Genre findGenreByName(String genreName) {
		String jpql = "SELECT g FROM Genre g WHERE g.name LIKE :name";

		try {
			return em.createQuery(jpql, Genre.class).setParameter("name", "%" + genreName + "%").getSingleResult();
		} catch (Exception e) {
			System.err.println("No genre found from: " + genreName);
			return null;
		}
	}
	
	@Override
	public List<Genre> sortByName(boolean ascendingOrder) {
		String jpql = "SELECT gen FROM Genre gen ORDER BY gen.name";
		
		if (ascendingOrder) {
			jpql += " ASC";

		} else {
			jpql += " DESC";

		}
		
		return em.createQuery(jpql, Genre.class)
				.getResultList();
	}
}
