package modls;


public class Media {

    private long id;

    private String url;

    private MediaType mMediaType;

    public Media () {
    }

    public long getId () {
        return id;
    }

    public void setId (long val) {
        this.id = val;
    }

    public MediaType getMediaType () {
        return mMediaType;
    }

    public void setMediaType (MediaType val) {
        this.mMediaType = val;
    }

    public String getUrl () {
        return url;
    }

    public void setUrl (String val) {
        this.url = val;
    }

}

