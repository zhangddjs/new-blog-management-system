package com.springmvc.service;

import com.springmvc.dao.DepartmentMapper;
import com.springmvc.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zdd
 * @date 2018-12-08 0:35
 */

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;


    public List<Department> getDepts() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
