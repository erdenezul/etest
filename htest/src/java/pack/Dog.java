/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author tulga
 */
public class Dog {

    long id;
    String name;
    Dog parent;
    Set<Dog> puppies = new HashSet();

    public Set<Dog> getPuppies() {
        return puppies;
    }

    public void setPuppies(Set<Dog> puppies) {
        this.puppies = puppies;
    }

    public Dog getParent() {
        return parent;
    }

    public void setParent(Dog parent) {
        this.parent = parent;
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

    public static void main(String[] args) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        List<Group> groups = s.createQuery("from Group").list();
        List<Kid> kids = s.createQuery("from Kid").list();
        for(Group g:groups) {
            for(Kid k:kids) {
                g.getKids().add(k);
                k.getGroups().add(g);
            }
        }
//        Kid k1 = new Kid();
//        k1.setName("Linda");
//        Kid k2 = new Kid();
//        k2.setName("Ronny");
//
//        Group g1 = new Group();
//        g1.setName("Math");
//        Group g2 = new Group();
//        g2.setName("History");
//
//        s.save(k1);
//        s.save(k2);
//        s.save(g1);
//        s.save(g2);
//
//        g1.getKids().add(k1);
//        g1.getKids().add(k2);
//
//        g2.getKids().add(k2);
//        s.persist(g1);
//        s.persist(g2);
//
//        System.out.println(g1.getId() + " " + g1.getName());
//        US_Teacher t1 = new US_Teacher();
//        t1.setCode("D.SW40");
//        t1.setFirstName("Douglas");
//        US_Teacher t2 = new US_Teacher();
//        t2.setCode("D.SW42");
//        t2.setFirstName("James");
//
//        US_Lesson l1 = new US_Lesson();
//        l1.setCode("D.SW202");
//        l1.setLessonName("Java Programming");
//        US_Lesson l2 = new US_Lesson();
//        l2.setCode("D.SW204");
//        l2.setLessonName("Data Structure");
//
//        s.save(t1);
//        s.save(t2);
//        s.save(l1);
//        s.save(l2);
//
//        t1.getLesson().add(l1);
//        t1.getLesson().add(l2);
//
//        t2.getLesson().add(l2);
        s.getTransaction().commit();
    }
}
