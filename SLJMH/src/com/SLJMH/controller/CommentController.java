
package com.SLJMH.controller;



import com.SLJMH.entity.Comment;

import com.SLJMH.entity.Reply;

import com.SLJMH.service.CommentService;

import com.SLJMH.service.ReplyService;
import com.SLJMH.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;

import java.util.Date;
import java.util.List;

/**
 * 用户投诉controller
 */
@Controller
@RequestMapping("/usercomment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private ReplyService replyService;
    @Autowired
    private UserService userService;

    

    /**
     * 跳到评论页面
     * @param contentId
     * @param model
     * @return
     */
    @RequestMapping("comment")
    public String comment(@RequestParam("contentId")int contentId, Model model){
        
      
        //获取在该内容下的所有评论
        List<Comment> commentList=commentService.findByContentId(contentId);
        //获取在该内容下的所有回复
        List<Reply> replyList=replyService.findByR_contentid(contentId);
    
        model.addAttribute("commentList",commentList);
        model.addAttribute("replyList",replyList);
        return "yorbeat/blog-details";

    }

 
    /**
     * 增加评论
     * @param comment
     * @return
     */
    @RequestMapping("addcomment")
    @ResponseBody
    public String addComment(Comment comment,HttpServletRequest request){
//        System.out.println("增加评论："+comment.toString());
        if(request.getParameter("c_content")!=null&& !request.getParameter("c_content").equals("")) {
            comment.setC_createtime(new Date());
            comment.setC_contentid(Integer.parseInt(request.getParameter("c_contentid")));
            comment.setC_otherid(Integer.parseInt(request.getParameter("c_otherid")));
            comment.setC_othername(request.getParameter("c_othername"));
            comment.setC_userid(Integer.parseInt(request.getParameter("c_userid")));
            comment.setC_username(request.getParameter("c_username"));
        	comment.setC_content(request.getParameter("c_content"));
        	commentService.createComment(comment);
            
        }
        return "/usercomment/comment.do?contentId="+comment.getC_contentid();
    }

   






}
