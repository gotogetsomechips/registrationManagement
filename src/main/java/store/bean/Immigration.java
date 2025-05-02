package store.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Immigration {
    private Integer id;
    private String immigrationName; // 姓名
    private String immigrationNumber; // 移民编号
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date immigrationDate;
    private String immigrationText; // 备注
    private String createBy;
    private Date createTime;
    private String updateBy;
    private Date updateTime;

    // getters and setters

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImmigrationName() {
        return immigrationName;
    }

    public void setImmigrationName(String immigrationName) {
        this.immigrationName = immigrationName;
    }

    public String getImmigrationNumber() {
        return immigrationNumber;
    }

    public void setImmigrationNumber(String immigrationNumber) {
        this.immigrationNumber = immigrationNumber;
    }

    public Date getImmigrationDate() {
        return immigrationDate;
    }

    public void setImmigrationDate(Date immigrationDate) {
        this.immigrationDate = immigrationDate;
    }

    public String getImmigrationText() {
        return immigrationText;
    }

    public void setImmigrationText(String immigrationText) {
        this.immigrationText = immigrationText;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}