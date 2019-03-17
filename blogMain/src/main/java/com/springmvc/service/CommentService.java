package com.springmvc.service;

import com.springmvc.dao.CommentMapper;
import com.springmvc.pojo.Category;
import com.springmvc.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zdd
 * @date 2018-12-20 16:31
 */
@Service
public class CommentService {

    @Autowired
    CommentMapper commentMapper;

    public void addComment(Comment comment) {
        commentMapper.insertSelective(comment);
    }

    public List<Comment> getAll() {
        List<Comment> list = commentMapper.selectByExampleWithBLOBsAndArticle(null);
        return list;
    }
}
