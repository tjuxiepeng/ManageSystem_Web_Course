package com.springapp.mvc.controller;

import com.springapp.mvc.dao.CriminalDao;
import com.springapp.mvc.pojo.Criminal;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;


/**
 * Created by xiepeng on 2015/12/30.
 */

//展示通缉犯的列表

@Controller
public class CriminalController {

    public static String condition = "";

    private static int currPage = 1;
    private static int totalPage;

    @Resource
    private CriminalDao criminalDao;

    @RequestMapping("/index")
    public String index(ModelMap map,HttpSession session){
        String identity = (String)session.getAttribute("identity");
        if (identity != null){
            if (identity.equals("admin")){
                map.addAttribute("identity","管理员");
            }else {
                map.addAttribute("identity","警员");
            }

            return "index";
        }else {
            return "redirect:/login";
        }

    }

    @RequestMapping("/criminal_list")
    public String criminalList(Map<String,Object> map,
                               @RequestParam(value="tag",required=false) String tag,HttpSession session){

        String identity = (String)session.getAttribute("identity");
        if (identity == null){
            return "redirect:/login";
        }

        //计算总页数
        if (criminalDao.getTotalCount()%3 == 0){
            totalPage = criminalDao.getTotalCount()/3;
        }else {
            totalPage = criminalDao.getTotalCount()/3+1;
        }
        map.put("total",totalPage);

        if (tag == null){
            currPage = 1;
            map.put("curr",currPage);
            map.put("employees",criminalDao.getSome(0));
            if (totalPage == 1){
                map.put("isLast","yes");
            }else {
                map.put("isLast","no");
            }

            map.put("isFirst","yes");
            return "criminal_list";
        }else if (tag.equals("next")){
            if (currPage < totalPage-1){
                System.out.println("here1");
                System.out.println(currPage);
                currPage += 1;
                System.out.println(currPage);
                map.put("curr",currPage);
                map.put("employees",criminalDao.getSome((currPage-1)*3));
                map.put("isLast","no");
            }else {
                currPage += 1;
                System.out.println("here2");
                map.put("curr",currPage);
                map.put("employees",criminalDao.getSome((currPage-1)*3));
                map.put("isLast","yes");
            }


            System.out.println(totalPage);

            return "criminal_list";

        }else if (tag.equals("end")){
            currPage = totalPage;
            map.put("curr",currPage);
            map.put("employees",criminalDao.getSome((currPage-1)*3));

            map.put("isLast","yes");

            return "criminal_list";
        }else if (tag.equals("first")){

            currPage = 1;
            map.put("curr",currPage);
            map.put("employees",criminalDao.getSome((currPage-1)*3));

            map.put("isFirst","yes");

            return "criminal_list";
        }else if (tag.equals("last")){
            if (currPage > 2){
                currPage -= 1;

                map.put("curr",currPage);
                map.put("employees",criminalDao.getSome((currPage-1)*3));
                map.put("isFirst","no");
            }else {
                currPage -= 1;

                map.put("curr",currPage);
                map.put("employees",criminalDao.getSome((currPage-1)*3));
                map.put("isFirst","yes");
            }


            return "criminal_list";
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
            map.put("employees",criminalDao.getSome((currPage-1)*3));

            return "criminal_list";
        }else {
            return null;
        }

    }






    //搜索通缉犯，对应方法
    @RequestMapping("/criminal_search")
    public String search(Map<String,Object> map,HttpSession session){

        String identity = (String)session.getAttribute("identity");
        if (identity == null){
            return "redirect:/login";
        }


        if (!condition.equals("")){
            Criminal criminal = criminalDao.getOneCriminalByNum(condition);
            ArrayList<Criminal> list = new ArrayList<Criminal>();
            if (criminal != null){
                list.add(criminal);
            }

            map.put("cri",list);
            condition = "";
        }
        return "criminal_delete";
    }

    //注销通缉犯界面
    @RequestMapping("/criminal_really_delete")
    public String deleteCriminal(HttpServletRequest request,HttpSession session){
        String identity = (String)session.getAttribute("identity");
        if (identity == null){
            return "redirect:/login";
        }


        condition = request.getParameter("s2");
        System.out.println(condition);

        return "redirect:/criminal_search";
    }

    //在列表界面删除一条信息
    @RequestMapping("/criminal_delete/{id}")
    public String criminalDelete(@PathVariable("id") Integer id){
        criminalDao.delete(id);

        return "redirect:/criminal_list?tag=curr";
    }

//    @RequestMapping(value = "/criminal_report",method = RequestMethod.POST)
//    public String criminalReport(){
//        return "criminal_report";
//    }

    //从list页面跳转到，编辑页面
    @RequestMapping(value = "/criminal_modify/{id}",method = RequestMethod.GET)
    public String modify(@PathVariable("id") Integer id,Map<String,Object> map,HttpSession session){
        String identity = (String)session.getAttribute("identity");
        if (identity == null){
            return "redirect:/login";
        }


        map.put("criminal",criminalDao.getOneCriminal(id));

        return "criminal_add";
    }

    @RequestMapping(value = "/criminal_add",method = RequestMethod.GET)
    public String criminalAdd(Map<String, Object> map,HttpSession session){
        String identity = (String)session.getAttribute("identity");
        if (identity == null){
            return "redirect:/login";
        }


        map.put("criminal",new Criminal());

        return "criminal_add";
    }

    //编辑后保存
    @RequestMapping(value = "/criminal_add1",method = RequestMethod.POST)
    public String save(@RequestParam MultipartFile upLoadPhoto,Criminal criminal,HttpServletRequest request)
            throws IOException {
            String sex = request.getParameter("sex");
            criminal.setGender(sex);

            if (!upLoadPhoto.isEmpty()){
                String newFileName = new Date().getTime()+".jpg";
//                FileUtils.copyInputStreamToFile(upLoadPhoto.getInputStream(), new File("F:\\IdeaProjects\\ManageSystem\\" +
//                        "target\\ManageSystem\\upLoadImages", newFileName));
                FileUtils.copyInputStreamToFile(upLoadPhoto.getInputStream(), new File("E:\\apache-tomcat-8.0.30-windows-x64\\apache-tomcat-8.0.30\\webapps\\" +
                        "ManageSystem\\upLoadImages", newFileName));

                criminal.setPhoto(newFileName);
            }

            criminalDao.delete(criminal.getId());
            criminalDao.save(criminal);

        return "redirect:/criminal_list";
    }

    @RequestMapping("/showPhoto/{photo}")
    public String showPhoto(@PathVariable("photo") String photo,ModelMap model,HttpSession session){
        String identity = (String)session.getAttribute("identity");
        if (identity == null){
            return "redirect:/login";
        }


        model.addAttribute("photo", photo);
        System.out.println(photo);

        return "criminal_pic";
    }
}
