/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.dal;

import hr.algebra.model.Genre;
import hr.algebra.model.Movie;
import hr.algebra.model.Person;
import java.util.List;
import java.util.Optional;

/**
 *
 * @author 38595
 */
public interface RepositoryMovie {
    
    int createMovie(Movie movie) throws Exception;
    void createMovies(List<Movie> movies) throws Exception;
    void updateMovie(int id, Movie data) throws Exception;
    void deleteMovie(int id) throws Exception;
    Optional<Movie> selectMovie(int id) throws Exception;
    List<Movie> selectMovies() throws Exception;
    void deleteMovies() throws Exception;//napraviti proceduru u bazi
    
    int createPerson(Person person) throws Exception;
    void updatePerson(int id, Person data) throws Exception;
    void deletePerson(int id) throws Exception;
    Optional<Person> selectPerson(int id) throws Exception;
    List<Person> selectPersons() throws Exception;
    
    int createGenre(Genre genre) throws Exception;
    void updateGenre(int id, Genre data) throws Exception;
    void deleteGenre(int id) throws Exception;
    Optional<Genre> selectGenre(int id) throws Exception;
    List<Genre> selectGenres() throws Exception;
    
    //napraviti procedure u bazi
    int createMovieAndPersons(Person person, Movie movie) throws Exception;
    List<Person> selectMovieAndPerson(int id) throws Exception;
    List<Person> selectMoviesAndPersons() throws Exception;
    void deleteMovieAndPerson(int movieId, int actorId) throws Exception;
    
}
