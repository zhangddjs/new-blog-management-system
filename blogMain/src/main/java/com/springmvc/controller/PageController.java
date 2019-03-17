package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author zdd
 * @date 2018-12-15 0:37
 */
@Controller
public class PageController {

    /**
     * 跳转到home.jsp页面
     */
    @ResponseBody
    @RequestMapping("/covfefe")
    public ModelAndView blogHomePage(){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("blogpages/covfefe");
        return retMap;
    }

    /**
     * 跳转到content.jsp页面
     */
    @ResponseBody
    @RequestMapping("/content/{articleId}")
    public ModelAndView blogContentPage(@PathVariable("articleId")Integer articleId){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("blogpages/content");
        retMap.addObject("articleId", articleId);
        return retMap;
    }

    /**
     * 跳转到contact.jsp页面
     */
    @ResponseBody
    @RequestMapping("/contact")
    public ModelAndView blogContactPage(){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("blogpages/contact");
        return retMap;
    }

    /**
     * 跳转到about.jsp页面
     */
    @ResponseBody
    @RequestMapping("/about")
    public ModelAndView blogAboutPage(){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("blogpages/about");
        return retMap;
    }

    //==============================================================================

    /**
     * 跳转到category.jsp页面
     */
    @ResponseBody
    @RequestMapping("/categoryPage")
    public ModelAndView categoryPage(){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("master/category");
        return retMap;
    }

    /**
     * 跳转到文章页面article.jsp
     * @return
     */
    @ResponseBody
    @RequestMapping("/articlePage")
    public ModelAndView articlePage(){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("master/article");
        return retMap;
    }

    /**
     * 跳转到草稿箱页面draft.jsp
     * @return
     */
    @ResponseBody
    @RequestMapping("/draftPage")
    public ModelAndView draftPage(){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("master/draft");
        return retMap;
    }

    /**
     * 跳转到回收站页面recycle.jsp
     * @return
     */
    @ResponseBody
    @RequestMapping("/recyclePage")
    public ModelAndView recyclePage(){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("master/recycle");
        return retMap;
    }

    /**
     * 跳转到文章添加页面article_add.jsp
     * @return
     */
    @ResponseBody
    @RequestMapping("/articleAddPage")
    public ModelAndView articleAddPage(){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("master/article_add");
        return retMap;
    }

    /**
     * 跳转到文章编辑页面article_edit.jsp
     * @return
     */
    @ResponseBody
    @RequestMapping("/articleEditPage/{editId}")
    public ModelAndView articleEditPage(@PathVariable("editId")Integer editId){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("master/article_edit");
        retMap.addObject("editId", editId);
        return retMap;
    }

}
