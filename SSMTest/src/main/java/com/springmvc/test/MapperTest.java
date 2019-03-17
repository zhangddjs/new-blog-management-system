package com.springmvc.test;

import com.springmvc.dao.DepartmentMapper;
import com.springmvc.dao.EmployeeMapper;
import com.springmvc.pojo.Department;
import com.springmvc.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * 测试dao层的工作
 * @author zdd
 * @date 2018-12-06 11:56
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1.导入SpringTest模块
 * 2.@ContextConfiguration指定Spring配置文件的位置
 * 3.直接autowired要使用的组件即可
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    /**
     * 测试DepartmentMapper
     */
    @Test
    public void testCRUD(){
        //1.创建SpringIOC容器
    //    ApplicationContext ioc = new ClassPathXmlApplicationContext("spring-mybatis.xml");
        //2.从容器中获取mapper
    //    DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
    //    System.out.println(departmentMapper);
    //    System.out.println("222");
        //1.插入几个部门
    //    departmentMapper.insertSelective(new Department(null, "开发部"));
    //    departmentMapper.insertSelective(new Department(null, "测试部"));

        //2.生成员工数据，测试员工插入
        //employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@ustc.edu.cn", 19));

        //3.批量插入多个员工：批量，使用可以执行批量操作的sqlSession
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0,5)+i;     //随机生成字符串
            mapper.insertSelective(new Employee(null, uid, "M", uid+"@ustc.edu.cn", 19));
        }
        /*for(){
            employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@ustc.edu.cn", 19));
        }时间长*/
        System.out.println("批量完成");




    }
}
