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
public class Kid {
    long id;
    String name;
    Set<Group> groups = new HashSet();

    public Set<Group> getGroups() {
        return groups;
    }

    public void setGroups(Set<Group> groups) {
        this.groups = groups;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    
}
