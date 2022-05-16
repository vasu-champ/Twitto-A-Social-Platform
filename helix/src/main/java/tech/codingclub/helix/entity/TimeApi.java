package tech.codingclub.helix.entity;

import tech.codingclub.helix.Public;

public class TimeApi {
    private long epoch_time;
    private String timr_str;

    public TimeApi() {

    }
     public TimeApi(String timr_str,long epoch_time)
     {
         this.timr_str=timr_str;
         this.epoch_time=epoch_time;
     }
}