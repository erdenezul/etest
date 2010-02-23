package modls;

import java.util.HashSet;
import java.util.Set;


public class Variant {

    private long id;
    private Test test;
    private Set questions = new HashSet(0);

    public Set getQuestions() {
        return questions;
    }

    public void setQuestions(Set questions) {
        this.questions = questions;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public Variant () {
    }

    public long getId () {
        return id;
    }

    public void setId (long val) {
        this.id = val;
    }

}

