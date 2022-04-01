/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.dal.sql;

/**
 *
 * @author 38595
 */
public class RepositoryFactory {
    
    public RepositoryFactory() {
    }
    //ubaciti generalni repositoryfactory
//    public static<T> T getRepository() throws Exception{
//        return new SqlRepository();
//    }
    
    public static SqlRepositoryMovie getSqlRepositoryMovie(){
        return new SqlRepositoryMovie();
    }
    
    public static SqlRepositoryUsers getSqlRepositoryUsers(){
        return new SqlRepositoryUsers();
    }
    
    
}
