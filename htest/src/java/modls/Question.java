package modls;

import java.util.HashSet;
import java.util.Set;

public class Question {

    public static final int MULTIPLE_CHOISE = 1;
    public static final int MULTIPLE_RESPONSE = 2;
    public static final int FILL_IN_BLANK = 3;
    public static final int TRUE_FALSE = 4;
    public static final int MATCH_PAIR = 5;
    public static final int OPEN_END = 6;
    private long id;
    private String question;
    private Set<Media> mMedia = new HashSet(0);
    private Topic topic;
    private Difficulty difficult;
    private UFile ufile;

    public UFile getUfile() {
        return ufile;
    }

    public void setUfile(UFile ufile) {
        this.ufile = ufile;
    }

    public String getTemplate() {
        return null;
    }

    public Difficulty getDifficult() {
        return difficult;
    }

    public void setDifficult(Difficulty difficult) {
        this.difficult = difficult;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Question() {
    }

    public long getId() {
        return id;
    }

    public void setId(long val) {
        this.id = val;
    }

    public Set<Media> getMedia() {
        return mMedia;
    }

    public void setMedia(Set<Media> val) {
        this.mMedia = val;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String val) {
        this.question = val;
    }

    public Double eval(Object answer) {
        return null;
    }
}

