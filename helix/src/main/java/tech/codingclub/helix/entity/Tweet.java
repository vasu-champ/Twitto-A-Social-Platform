package tech.codingclub.helix.entity;

/**
 * Created by hackme on 2/7/18.
 */
public class Tweet {

    public String message;
    public Long author_id;
    public Long created_id;
    public Long  id;

    public Tweet(){

    }
    public Tweet(String message,Long author_id,Long id,Long created_id){
        this.author_id=author_id;
        this.created_id=created_id;
        this.message=message;
        this.id=id;
    }

}
