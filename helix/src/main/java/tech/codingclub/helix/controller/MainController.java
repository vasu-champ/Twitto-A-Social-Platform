package tech.codingclub.helix.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import tech.codingclub.helix.database.GenericDB;
import tech.codingclub.helix.entity.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;

/**
 * User: rishabh``
 *
 */
@Controller
@RequestMapping("/")
public class MainController extends BaseController {

    private static Logger logger = Logger.getLogger(MainController.class);

    @RequestMapping(method = RequestMethod.GET, value = "/MissionHelixCodersSocialPlateForm")
    public String coders(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "HelixCoder";
    }
    @RequestMapping(method = RequestMethod.GET, value = "/helloworld")
    public String getQuiz(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "hello";
    }


    @RequestMapping(method = RequestMethod.GET, value = "/signup")
    public String signup(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "signup";
    }
    @RequestMapping(method = RequestMethod.POST, value = "/signup")
    public
    @ResponseBody
    SignupResponce signUpData(@RequestBody  Member member, HttpServletRequest request, HttpServletResponse response) {
        boolean user_created=false;
        String message="";

        if (GenericDB.getCount(tech.codingclub.helix.tables.Member.MEMBER, tech.codingclub.helix.tables.Member.MEMBER.EMAIL.eq(member.email)) > 0) {

            message = "user already exist for this  email id!";
        }else {

            member.role="cm";
            new GenericDB<Member>().addRow(tech.codingclub.helix.tables.Member.MEMBER,member);
            user_created=true;
            message="User Created !";
        }
        return new SignupResponce(message,user_created);

        }
    @RequestMapping(method = RequestMethod.GET, value = "/api/time")
    public @ResponseBody String getTime(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        TimeApi timeApi=new TimeApi(new Date().toString(),new Date().getTime());
        return new Gson().toJson(timeApi);
    }
    @RequestMapping(method = RequestMethod.GET, value = "/api/wiki")
    public @ResponseBody String getwikiresultGson(ModelMap modelMap,@RequestParam("country")String country, HttpServletResponse response, HttpServletRequest request) {
        WikipediaDownloader wikipediaDownloader=new WikipediaDownloader(country);
        WikiResult x=wikipediaDownloader.getWikiResult();
        return new Gson().toJson(x);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/api/wiki/html")
    public String getwikiresultHTML(ModelMap modelMap,@RequestParam("country")String country, HttpServletResponse response, HttpServletRequest request) {
        WikipediaFetcher wikipediaFetcher = new WikipediaFetcher(country);
        WikiResult wikiResult = wikipediaFetcher.getResult();
        modelMap.addAttribute("IMAGE",wikiResult.getImage_url());
        modelMap.addAttribute("DESCRIPTION",wikiResult.getText_result());
        return "wikiapi";
    }


    @RequestMapping(method = RequestMethod.GET, value = "/songlist")
    public String songlist(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "songpg";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/songlist")
    public
    @ResponseBody
    SignupResponce songdata(@RequestBody  Member member, HttpServletRequest request, HttpServletResponse response) {
        boolean user_created=false;
        String message="";

        if (GenericDB.getCount(tech.codingclub.helix.tables.Member.MEMBER, tech.codingclub.helix.tables.Member.MEMBER.EMAIL.eq(member.email)) > 0) {

            message = "user already exist for this  email id!";
        }else {

            member.role="cm";
            new GenericDB<Member>().addRow(tech.codingclub.helix.tables.Member.MEMBER,member);
            user_created=true;
            message="User Created !";
        }
        return new SignupResponce(message,user_created);

    }
    @RequestMapping(method = RequestMethod.POST, value = "/handle")
    public
    @ResponseBody
    String handleEncrypt(@RequestBody String data, HttpServletRequest request, HttpServletResponse response) {
        return "ok";
    }
}