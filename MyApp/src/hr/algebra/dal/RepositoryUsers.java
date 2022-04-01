/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.dal;

import hr.algebra.model.User;
import java.util.Optional;

/**
 *
 * @author 38595
 */
public interface RepositoryUsers {
    int createUser(User user) throws Exception;
    Optional<User> selectUser(String id) throws Exception;
    boolean doesUserExist(String id) throws Exception;
}
