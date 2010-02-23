package modls;

import java.util.HashSet;
import java.util.Set;

public class Lesson {

    private long id;
    private String code;
    private String lessonName;
    private Set<Test> mExam = new HashSet(0);
    private Set<Student> mStudent = new HashSet(0);
    private Set<Teacher> mTeacher = new HashSet(0);
    private Set<Topic> topic = new HashSet(0);

    public Set<Topic> getTopic() {
        return topic;
    }

    public void setTopic(Set<Topic> topic) {
        this.topic = topic;
    }

    public Lesson() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String val) {
        this.code = val;
    }

    public long getId() {
        return id;
    }

    public void setId(long val) {
        this.id = val;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String val) {
        this.lessonName = val;
    }

    public Set<Test> getExam() {
        return mExam;
    }

    public void setExam(Set<Test> val) {
        this.mExam = val;
    }

    public Set<Student> getStudent() {
        return mStudent;
    }

    public void setStudent(Set<Student> val) {
        this.mStudent = val;
    }

    public Set<Teacher> getTeacher() {
        return mTeacher;
    }

    public void setTeacher(Set<Teacher> val) {
        this.mTeacher = val;
    }
}

