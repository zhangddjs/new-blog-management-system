package com.springmvc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springmvc.pojo.Article;
import com.springmvc.pojo.Comment;
import com.springmvc.pojo.Msg;
import com.springmvc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
 * @date 2018-12-20 16:30
 */
@Controller
public class CommentController {
    @Autowired
    CommentService commentService;

    @ResponseBody
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public Msg addComment(@Valid Comment comment, BindingResult result){
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
            commentService.addComment(comment);
            return Msg.success();
        }
    }

    /**
     * 导入jackson包，获取评论列表
     * @return
     */
    @RequestMapping("/comments")
    @ResponseBody
    public Msg getCommentsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn){
        PageHelper.startPage(pn, 5);
        List<Comment> comments = commentService.getAll();

        PageInfo page = new PageInfo(comments, 5);
        return Msg.success().add("pageInfo", page);         //.add.add
    }

    /**
     * 根据文章id获取评论
     * @param id
     * @return
     */
    @RequestMapping("/comments/{id}")
    @ResponseBody
    public Msg getCommentsByArticleId(@PathVariable("id") Integer id){
        List<Comment> comments = commentService.getCommentsByArticleId(id);
        return Msg.success().add("comments", comments);        //.add.add
    }

    /**
     * 单个批量二合一
     * 批量删除：1-2-3
     * 单个删除：1
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/comment/{id}", method = RequestMethod.DELETE)
    public Msg deleteComment(@PathVariable("id")String ids){
        //批量删除
        if (ids.contains("-")) {
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for (String string : str_ids) {
                Integer id = Integer.parseInt(string);
                del_ids.add(Integer.parseInt(string));
            }
            commentService.deleteBatch(del_ids);
        }else {
            Integer id = Integer.parseInt(ids);
            commentService.deleteComment(id);
        }
        return Msg.success();
    }
}
