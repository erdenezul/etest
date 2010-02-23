package modls;

import java.util.HashSet;
import java.util.Set;

public class Student extends SystemUser {

    private String code;

    private String firstName;

    private String lastName;

    private Set<Grade> mGrade = new HashSet(0);

    private Set<Lesson> mLesson = new HashSet(0);

    public Student () {
    }

    public String getCode () {
        return code;
    }

    public void setCode (String val) {
        this.code = val;
    }

    public String getFirstName () {
        return firstName;
    }

    public void setFirstName (String val) {
        this.firstName = val;
    }

    public String getLastName () {
        return lastName;
    }

    public void setLastName (String val) {
        this.lastName = val;
    }

    public Set<Grade> getGrade () {
        return mGrade;
    }

    public void setGrade (Set<Grade> val) {
        this.mGrade = val;
    }

    public Set<Lesson> getLesson () {
        return mLesson;
    }

    public void setLesson (Set<Lesson> val) {
        this.mLesson = val;
    }

}

