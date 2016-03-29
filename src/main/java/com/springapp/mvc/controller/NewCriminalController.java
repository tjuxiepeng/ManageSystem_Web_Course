package com.springapp.mvc.controller;

import com.springapp.mvc.dao.CriminalDao;
import com.springapp.mvc.dao.NewCriminalDao;
import com.springapp.mvc.pojo.Criminal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by xiepeng on 2016/1/9.
 */
@Controller
public class NewCriminalController {

    @Resource
    private NewCriminalDao newCriminalDao;

    @RequestMapping(value = "/criminal_report")
    public String criminalReportList(Map<String,Object> map){
        map.put("new_employees",newCriminalDao.getAll());

        return "criminal_report";
    }

    @RequestMapping("/new_criminal_drop/{id}")
    public String addCriminalInto(@PathVariable("id") Integer id){

        newCriminalDao.deleteOneNewCriminal(id);

        return "redirect:/criminal_report";
    }
}
