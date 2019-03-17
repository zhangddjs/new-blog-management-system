package com.springmvc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springmvc.pojo.Article;
import com.springmvc.pojo.Msg;
import com.springmvc.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zdd
 * @date 2018-12-15 0:35
 */
@Controller
public class ArticleController {

    @Autowired
    ArticleService articleService;

    /**
     * 添加文章
     * 1、支持JSR303校验
     * 2、导入Hibernate-Validator
     *
     *
     * /category/{id} GET 查询文章
     * /category      POST 添加文章
     * /category/{id} PUT 修改文章
     * /category/{id} DELETE 删除文章
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/article", method = RequestMethod.POST)
    public Msg addArticle(@Valid Article article, BindingResult result){
        if (result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            articleService.addArticle(article);
            return Msg.success();
        }
    }

    /**
     * 文章更新方法
     * @param article
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/article/{id}", method = RequestMethod.PUT)
    public Msg updateArticle(Article article){
        System.out.println("将要更新的文章数据，"+article);
        articleService.updateArticle(article);
        return Msg.success();
    }

    /**
     * 文章阅读
     * @param article
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/articleViewed/{id}", method = RequestMethod.PUT)
    public Msg readArticle(Article article){
        System.out.println("将要更新的文章数据，"+article);
        articleService.readArticle(article);
        return Msg.success();
    }

    /**
     * 文章放入回收站方法
     * @param article
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/articleRecycle/{id}", method = RequestMethod.PUT)
    public Msg removeArticle(Article article){
        System.out.println("将要更新的文章数据，"+article);
        articleService.removeArticle(article);
        return Msg.success();
    }

    /**
     * 单个批量二合一
     * 批量删除：1-2-3
     * 单个删除：1
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/article/{id}", method = RequestMethod.DELETE)
    public Msg deleteArticle(@PathVariable("id")String ids){
        //批量删除
        if (ids.contains("-")) {
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for (String string : str_ids) {
                Integer id = Integer.parseInt(string);
                del_ids.add(id);
            }
            articleService.deleteBatch(del_ids);
        }else {
            Integer id = Integer.parseInt(ids);
            articleService.deleteArticle(id);
        }
        return Msg.success();
    }

    /**
     * 导入jackson包，获取文章列表
     * @param pn
     * @return
     */
    @RequestMapping("/articles")
    @ResponseBody
    public Msg getArticlesWithJson(@RequestParam(value = "pn", defaultValue = "1")Integer pn){
        //这不是一个分页查询：
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页大小。
        PageHelper.startPage(pn, 5);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Article> articles = articleService.getAll();
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(articles, 5);
        return Msg.success().add("pageInfo", page);         //.add.add
    }

    /**
     * 搜索文章
     * @param pn
     * @return
     */
    @RequestMapping("/searchedArticles/{searchKeyword}")
    @ResponseBody
    public Msg getSearchedArticles(@PathVariable("searchKeyword") String searchKeyword,
                                   @RequestParam(value = "pn", defaultValue = "1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Article> articles = articleService.getSearchedArticles(searchKeyword);
        PageInfo page = new PageInfo(articles, 5);
        return Msg.success().add("pageInfo", page);         //.add.add
    }

    /**
     * 搜索文章并筛选类别
     * @param pn
     * @return
     */
    @RequestMapping("/searchedArticlesByCategory/{searchKeyword}/{categoryId}")
    @ResponseBody
    public Msg getSearchedArticlesByCategory(@PathVariable("categoryId") Integer categoyId,
                                             @PathVariable("searchKeyword") String searchKeyword,
                                             @RequestParam(value = "pn", defaultValue = "1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Article> articles = articleService.getSearchedArticlesByCategory(searchKeyword, categoyId);
        PageInfo page = new PageInfo(articles, 5);
        return Msg.success().add("pageInfo", page);         //.add.add
    }

    /**
     * 根据id查询文章
     * @param id
     * @return
     */
    @RequestMapping(value = "/article/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getArticle(@PathVariable("id") Integer id){

        Article article = articleService.getArticle(id);
        return Msg.success().add("article", article);
    }

    /**
     * 根据类别查询文章
     * @param categoyId
     * @return
     */
    @RequestMapping(value = "/articlesByCategory/{categoryId}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getArticlesByCategory(@PathVariable("categoryId") Integer categoyId,
                                    @RequestParam(value = "pn", defaultValue = "1") Integer pn){


        PageHelper.startPage(pn, 5);
        List<Article> articles = articleService.getArticlesByCategory(categoyId);
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(articles, 5);
        return Msg.success().add("pageInfo", page);         //.add.add
    }

    /**
     * 测试——查询文章数据（分页查询）
     * @return
     */
    @RequestMapping("/article")
    public String getArticles(@RequestParam(value = "pn", defaultValue = "1")Integer pn,
                                Model model){
        //这不是一个分页查询：
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页大小。
        PageHelper.startPage(pn, 5);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Article> articles = articleService.getAll();
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(articles, 5);
        model.addAttribute("pageInfo", page);

        return "list";
    }

}
