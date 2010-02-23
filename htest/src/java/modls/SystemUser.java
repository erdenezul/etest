package modls;


public class SystemUser {

    private long id;

    private String userName;

    private String pass;

    public SystemUser () {
    }

    public long getId () {
        return id;
    }

    public void setId (long val) {
        this.id = val;
    }

    public String getPass () {
        return pass;
    }

    public void setPass (String val) {
        this.pass = val;
    }

    public String getUserName () {
        return userName;
    }

    public void setUserName (String val) {
        this.userName = val;
    }

}

