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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
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
    public Msg addArticle(@Valid Comment comment, BindingResult result){
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
    public Msg getCommentsWithJson(){
        List<Comment> comments = commentService.getAll();
        return Msg.success().add("comments", comments);        //.add.add
    }

}
