package com.SLJMH.entity;

import org.hibernate.annotations.Entity;

import javax.persistence.Table;
import java.util.Date;

/**
 * 好友实体
 */
public class FriendShip {

    /**
     * 主键
     */
    private Long id;
    /**
     * 用户id
     */
    private Long userId;

    /**
     * 好友
     */
    private Long friendUserId;

    /**
     * 好友头像
     */
    private String friendUserPic;

    /**
     * 添加好友时间
     */
    private Date addTime;

    /**
     * 关系状态  0 等待对方同意  1 好友  2 已被对方删除
     */
    private int status = 0;

    /**
     * 好友昵称
     */
    private String friendNickName;

    /**
     * 好友备注
     */
    private String remark;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getFriendUserId() {
        return friendUserId;
    }

    public void setFriendUserId(Long friendUserId) {
        this.friendUserId = friendUserId;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFriendNickName() {
        return friendNickName;
    }

    public void setFriendNickName(String friendNickName) {
        this.friendNickName = friendNickName;
    }

    public Long getId() {

        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFriendUserPic() {
        return friendUserPic;
    }

    public void setFriendUserPic(String friendUserPic) {
        this.friendUserPic = friendUserPic;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return new org.apache.commons.lang.builder.ToStringBuilder(this)
                .append("id", id)
                .append("userId", userId)
                .append("friendUserId", friendUserId)
                .append("friendUserPic", friendUserPic)
                .append("addTime", addTime)
                .append("status", status)
                .append("friendNickName", friendNickName)
                .append("remark", remark)
                .toString();
    }
}
