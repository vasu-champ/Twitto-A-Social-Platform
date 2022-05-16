package tech.codingclub.helix.entity;


/**
 * Created by hackme on 2/7/18.
 */
public class TweetUI  extends Tweet {

    public  String author_name;
    public  String email;
    public TweetUI(){

    }
    public TweetUI(Tweet tweet,Member member){
        this.author_id=tweet.author_id;
        this.created_id=tweet.created_id;
        this.message=tweet.message;
        this.id=tweet.id;
        this.author_name=member.name;
        this.email=member.email;

    }

}
