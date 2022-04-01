/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author 38595
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Genre implements Comparable<Genre>  {

     private static final String DELIMITER=",";
      
    @XmlTransient
    private int id;
    @XmlElement(name = "name")
    private String name;

    
    
    public Genre() {
    }

    public Genre(String name) {
        this.name = name;
    }
      
    public Genre(int id, String name) {
        this(name);
        this.id = id;
    }

    public Genre(int id) {  
        this.id = id;
    }
    
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + this.id;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Genre other = (Genre) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }
    
    public static Genre formatForRSS(String line){
    
    String[] fullNames=line.split(DELIMITER);
    
    return new Genre(fullNames[0]);
    }

    @Override
    public String toString() {
        return name;
    }
    
    @Override
    public int compareTo(Genre o) {
        return Integer.valueOf(id).compareTo(o.id); //To change body of generated methods, choose Tools | Templates.
    }

    
}
