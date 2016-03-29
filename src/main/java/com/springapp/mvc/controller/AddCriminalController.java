package com.springapp.mvc.controller;

import com.springapp.mvc.dao.NewCriminalDao;
import com.springapp.mvc.pojo.CriminalInfo;
import com.springapp.mvc.pojo.SearchCondition;
import com.springapp.mvc.pojo.SearchSqlCondition;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by xiepeng on 2016/1/9.
 */

//普通网民的操作

@Controller
public class AddCriminalController {

    //查询条件
    private static SearchSqlCondition sqlCondition = new SearchSqlCondition();

    private static int currPage = 1;
    private static int totalPage;

    @Resource
    private NewCriminalDao newCriminalDao;

    @RequestMapping("/addIndex")
    public String addIndex(){
        return "add_index";
    }

    //左侧菜单
    @RequestMapping(value = "/addOne",method = RequestMethod.GET)
    public String addOneCriminal(Map<String, Object> map){
        map.put("criminalInfo",new CriminalInfo());

        return "add_criminal";
    }

    //保存一条记录
    @RequestMapping(value = "/addOne",method = RequestMethod.POST)
    public String save(CriminalInfo criminalInfo){
        newCriminalDao.addOneCriminal(criminalInfo);

        return "redirect:/addOne";
    }

    //左侧菜单
    @RequestMapping("/search")
    public String search(Map<String, Object> map){
        map.put("searchCondition",new SearchCondition());

        return "add_search_criminal";
    }

    //提交搜索条件
    @RequestMapping(value = "/searchCommit",method = RequestMethod.POST)
    public String searchCommit(SearchCondition condition,Map<String,Object> map){
        if (condition.getMinHeight().equals("")){
            condition.setMinHeight("0");
        }
        if (condition.getMaxHeight().equals("")){
            condition.setMaxHeight("300");
        }
        if (condition.getMinWeight().equals("")){
            condition.setMinWeight("0");
        }
        if (condition.getMaxWeight().equals("")){
            condition.setMaxWeight("200");
        }

        sqlCondition.setName(condition.getName());
        sqlCondition.setNum(condition.getNum());
        sqlCondition.setMinHeight(Integer.valueOf(condition.getMinHeight()));
        sqlCondition.setMaxHeight(Integer.valueOf(condition.getMaxHeight()));
        sqlCondition.setMinWeight(Integer.valueOf(condition.getMinWeight()));
        sqlCondition.setMaxWeight(Integer.valueOf(condition.getMaxWeight()));


//        map.put("employees",newCriminalDao.getCriminalByCondition(sqlCondition));
//
//        return "add_search_criminal_result";

        return "redirect:/new_criminal_search";
    }

    @RequestMapping(value = "/new_criminal_search")
    public String searchSplit(Map<String,Object> map,
                              @RequestParam(value="tag",required=false) String tag){
//计算总页数
        if (newCriminalDao.getTotalCount(sqlCondition)%3 == 0){
            totalPage = newCriminalDao.getTotalCount(sqlCondition)/3;
        }else {
            totalPage = newCriminalDao.getTotalCount(sqlCondition)/3+1;
        }
        map.put("total",totalPage);



        if (tag == null){
            currPage = 1;
            map.put("curr",currPage);
            sqlCondition.setScope((currPage-1)*3);
            map.put("employees",newCriminalDao.getSome(sqlCondition));
            if (totalPage == 1){
                map.put("isLast","yes");
            }else {
                map.put("isLast","no");
            }

            map.put("isFirst","yes");
            return "add_search_criminal_result";
        }else if (tag.equals("next")){
            if (currPage < totalPage-1){
                currPage += 1;

                map.put("curr",currPage);
                sqlCondition.setScope((currPage-1)*3);
                map.put("employees",newCriminalDao.getSome(sqlCondition));
                map.put("isLast","no");
            }else {
                currPage += 1;
                System.out.println("here2");
                map.put("curr",currPage);
                sqlCondition.setScope((currPage-1)*3);
                map.put("employees",newCriminalDao.getSome(sqlCondition));
                map.put("isLast","yes");
            }


            System.out.println(totalPage);

            return "add_search_criminal_result";

        }else if (tag.equals("end")){
            currPage = totalPage;
            map.put("curr",currPage);
            sqlCondition.setScope((currPage-1)*3);
            map.put("employees",newCriminalDao.getSome(sqlCondition));

            map.put("isLast","yes");

            return "add_search_criminal_result";
        }else if (tag.equals("first")){

            currPage = 1;
            map.put("curr",currPage);
            sqlCondition.setScope((currPage-1)*3);
            map.put("employees",newCriminalDao.getSome(sqlCondition));

            map.put("isFirst","yes");

            return "add_search_criminal_result";
        }else if (tag.equals("last")){
            if (currPage > 2){
                currPage -= 1;

                map.put("curr",currPage);
                sqlCondition.setScope((currPage-1)*3);
                map.put("employees",newCriminalDao.getSome(sqlCondition));
                map.put("isFirst","no");
            }else {
                currPage -= 1;

                map.put("curr",currPage);
                sqlCondition.setScope((currPage-1)*3);
                map.put("employees", newCriminalDao.getSome(sqlCondition));
                map.put("isFirst","yes");
            }


            return "add_search_criminal_result";
        }else if (tag.equals("curr")){
            if (currPage == 1){
                map.put("isFirst","yes");
            }else if (currPage == totalPage){
                map.put("isLast","yes");
            }else if (currPage > totalPage){
                currPage -= 1;
                map.put("isLast","yes");
            }
            map.put("curr",currPage);
            sqlCondition.setScope((currPage-1)*3);
            map.put("employees",newCriminalDao.getSome(sqlCondition));

            return "add_search_criminal_result";
        }else {
            return null;
        }

    }
}
