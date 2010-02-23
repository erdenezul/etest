package modls;


public class Rooms {

    private long id;

    private String networkaddress;

    private String desc;

    public Rooms () {
    }

    public String getDesc () {
        return desc;
    }

    public void setDesc (String val) {
        this.desc = val;
    }

    public long getId () {
        return id;
    }

    public void setId (long val) {
        this.id = val;
    }

    public String getNetworkaddress () {
        return networkaddress;
    }

    public void setNetworkaddress (String val) {
        this.networkaddress = val;
    }

}

