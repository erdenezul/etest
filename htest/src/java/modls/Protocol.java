package modls;


public class Protocol {

    private long id;

    private String content;

    private Test test;

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public Protocol () {
    }

    public String getContent () {
        return content;
    }

    public void setContent (String val) {
        this.content = val;
    }

    public long getId () {
        return id;
    }

    public void setId (long val) {
        this.id = val;
    }

}

