package com.springmvc.pojo;

public class Admin {
    private Integer id;

    private String adminName;

    private String adminPwd;

    public Admin() {}

    public Admin(Integer id, String adminName, String adminPwd) {
        this.id = id;
        this.adminName = adminName;
        this.adminPwd = adminPwd;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd == null ? null : adminPwd.trim();
    }
}