package modls;

import java.util.HashSet;
import java.util.Set;

public class Teacher extends SystemUser {

    private String code;

    private String firstName;

    private String lastName;

    private Set<Lesson> mLesson = new HashSet(0);

    private Set<UFile> files = new HashSet(0);

    public Set<UFile> getFiles() {
        return files;
    }

    public void setFiles(Set<UFile> files) {
        this.files = files;
    }

    public Teacher () {
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

    public Set<Lesson> getLesson () {
        return mLesson;
    }

    public void setLesson (Set<Lesson> val) {
        this.mLesson = val;
    }

}

