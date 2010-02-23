/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modls;

/**
 *
 * @author tulga
 */
public class Topic {
    private long id;
    private Lesson lesson;
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Lesson getLesson() {
        return lesson;
    }

    public void setLesson(Lesson lesson) {
        this.lesson = lesson;
    }
    
}
