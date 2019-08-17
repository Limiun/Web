package com.SLJMH.constant;

/**
 * 好友关系状态常量
 *
 */
public class FriendShipStatus {
    /**
     * 等待对方确认好友请求
     */
    public static final int WAIT_PEER_CONFIRM = 0;

    /**
     * 好友关系已建立
     */
    public static final int FRIEND = 1;

    /**
     * 对方已删除
     */
    public static final int PEER_DELETED = 2;

    /**
     * 确认对方好友邀请
     */
    public static final int WAIT_SELF_CONFIRM = 3;
}
