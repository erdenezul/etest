/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package pack;

import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author tulga
 */
public class Group {
    long id;
    String name;
    Set<Kid> kids = new HashSet();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Set<Kid> getKids() {
        return kids;
    }

    public void setKids(Set<Kid> kids) {
        this.kids = kids;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    
}
