package com.SLJMH.controller;

import com.SLJMH.dto.JsonResult;
import com.SLJMH.entity.FriendShip;
import com.SLJMH.service.FriendShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 好友管理
 */
@Controller
@RequestMapping("/friends")
public class UserFriendShipController {

    private final long TEST_USER_ID = 1L;


    @Autowired
    private FriendShipService<FriendShip> friendShipService;


    @RequestMapping(value = "index")
    public String index(Model model, HttpServletRequest request){
        long userId = (int) request.getSession().getAttribute("userid");
        if(userId <= 0){
            userId = TEST_USER_ID;
        }

        List<FriendShip> allFriends =  friendShipService.findAllByUserId(userId);
        model.addAttribute("friends",allFriends);
        return "friends/friend_ship";
    }

    @RequestMapping("del")
    @ResponseBody
    public JsonResult del(long id,JsonResult result){
        try{
            friendShipService.delete(id);
            result.setMsg("删除好友成功");
        }
        catch (Exception e){
            result.setSuccess(false);
            result.setMsg("删除好友出错:"+e.getMessage());
        }
        return result;
    }

    @RequestMapping("updateRemark")
    @ResponseBody
    public JsonResult updateRemark(long id,String remark,JsonResult result){
        try{
            friendShipService.updateRemark(id,remark);
            result.setMsg("好友备注修改成功");
        }
        catch (Exception e){
            result.setSuccess(false);
            result.setMsg("修改备注出错:"+e.getMessage());
        }

        return result;
    }

    @RequestMapping(value = "agree")
    @ResponseBody
    public JsonResult agree(long id,JsonResult result){
        try{
            friendShipService.updateStatusToAgree(id);
            result.setMsg("已经是好友啦");
        }
        catch (Exception e){
            result.setSuccess(false);
            result.setMsg("通过好友邀请出错:"+e.getMessage());
        }

        return  result;
    }


    @RequestMapping("addFriend")
    @ResponseBody
    public JsonResult addFriend(String friendUserKey, JsonResult result, HttpServletRequest request){
        try{
            long userId = (int) request.getSession().getAttribute("userid");
            if(userId <= 0){
                userId = TEST_USER_ID;
            }

            friendShipService.addFriend(userId,friendUserKey);
            result.setMsg("添加好友成功，请耐心等待对方通过");
        }
        catch (Exception e){
            result.setSuccess(false);
            result.setMsg("添加好友出错:"+e.getMessage());
        }

        return  result;
    }


}
