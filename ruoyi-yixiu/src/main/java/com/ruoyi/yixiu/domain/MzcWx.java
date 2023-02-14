package com.ruoyi.yixiu.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 微信用户对象 mzc_wx
 * 
 * @author mmmmnd
 * @date 2023-02-14
 */
public class MzcWx extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 微信用户id */
    @Excel(name = "微信用户id")
    private Long wxUserId;

    /** 系统用户id */
    @Excel(name = "系统用户id")
    private Long userId;

    /** 微信openid */
    @Excel(name = "微信openid")
    private String wxOpenId;

    /** 昵称 */
    @Excel(name = "昵称")
    private String nickname;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 性别 */
    @Excel(name = "性别")
    private String sex;

    /** 头像 */
    @Excel(name = "头像")
    private String avatar;

    /** 帐号状态（0正常 1停用） */
    @Excel(name = "帐号状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    @Excel(name = "删除标志", readConverterExp = "0=代表存在,2=代表删除")
    private String delFlag;

    @ApiModelProperty(value = "删除者")
    private String deleteBy;

    /** 最后登录IP */
    @Excel(name = "最后登录IP")
    private String loginIp;

    /** 最后登录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date loginDate;

    public void setWxUserId(Long wxUserId) 
    {
        this.wxUserId = wxUserId;
    }

    public Long getWxUserId() 
    {
        return wxUserId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setWxOpenId(String wxOpenId) 
    {
        this.wxOpenId = wxOpenId;
    }

    public String getWxOpenId() 
    {
        return wxOpenId;
    }
    public void setNickname(String nickname) 
    {
        this.nickname = nickname;
    }

    public String getNickname() 
    {
        return nickname;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setSex(String sex) 
    {
        this.sex = sex;
    }

    public String getSex() 
    {
        return sex;
    }
    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    public void setLoginIp(String loginIp) 
    {
        this.loginIp = loginIp;
    }

    public String getDeleteBy() {
        return deleteBy;
    }

    public void setDeleteBy(String deleteBy) {
        this.deleteBy = deleteBy;
    }

    public String getLoginIp()
    {
        return loginIp;
    }
    public void setLoginDate(Date loginDate) 
    {
        this.loginDate = loginDate;
    }

    public Date getLoginDate() 
    {
        return loginDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("wxUserId", getWxUserId())
            .append("userId", getUserId())
            .append("wxOpenId", getWxOpenId())
            .append("nickname", getNickname())
            .append("phone", getPhone())
            .append("sex", getSex())
            .append("avatar", getAvatar())
            .append("remark", getRemark())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("deleteBy", getDeleteBy())
            .append("loginIp", getLoginIp())
            .append("loginDate", getLoginDate())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
