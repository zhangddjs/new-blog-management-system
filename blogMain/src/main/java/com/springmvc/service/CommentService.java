package com.springmvc.service;

import com.springmvc.dao.CommentMapper;
import com.springmvc.pojo.*;
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
        CommentExample example = new CommentExample();
        example.setOrderByClause("post_time DESC,co.id ASC");
        return commentMapper.selectByExampleWithBLOBsAndArticle(example);
    }

    public List<Comment> getCommentsByArticleId(Integer id)
    {
        CommentExample example = new CommentExample();
        example.setOrderByClause("post_time DESC");
        CommentExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andArticleIdEqualTo(id);
        return commentMapper.selectByExampleWithBLOBs(example);
    }

    public void deleteBatch(List<Integer> del_ids) {
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andIdIn(del_ids);
        commentMapper.deleteByExample(example);
    }

    public void deleteComment(Integer id) {
        commentMapper.deleteByPrimaryKey(id);
    }
}
