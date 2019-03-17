package com.springmvc.pojo;

import java.util.Date;

public class Article {
    private Integer id;

    private String title;

    private String author;

    private Integer favorNum;

    private Integer pageviewNum;

    private Date postTime;

    private Integer categoryId;

    private String brief;

    private String imgUrl;

    private String content;

    private Category category;

    public Article() {
    }

    public Article(Integer id, String title, String author, Integer favorNum, Integer pageviewNum, Date postTime, Integer categoryId, String brief, String imgUrl, String content) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.favorNum = favorNum;
        this.pageviewNum = pageviewNum;
        this.postTime = postTime;
        this.categoryId = categoryId;
        this.brief = brief;
        this.imgUrl = imgUrl;
        this.content = content;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", favorNum=" + favorNum +
                ", pageviewNum=" + pageviewNum +
                ", postTime=" + postTime +
                ", categoryId=" + categoryId +
                ", brief='" + brief + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", content='" + content + '\'' +
                ", category=" + category +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Integer getFavorNum() {
        return favorNum;
    }

    public void setFavorNum(Integer favorNum) {
        this.favorNum = favorNum;
    }

    public Integer getPageviewNum() {
        return pageviewNum;
    }

    public void setPageviewNum(Integer pageviewNum) {
        this.pageviewNum = pageviewNum;
    }

    public Date getPostTime() {
        return postTime;
    }

    public void setPostTime(Date postTime) {
        this.postTime = postTime;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief == null ? null : brief.trim();
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}