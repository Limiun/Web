
package com.SLJMH.controller;

import com.SLJMH.dto.JsonResult;
import com.SLJMH.service.ComplaintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * 投诉处理控制器
 */
@Controller
@RequestMapping("/manage/complaint")
public class ManageComplaintController {

    @Autowired
    private ComplaintService complaintService;

    @RequestMapping("manageComplaintList")
    public String manageComplaintList(Model model){
        model.addAttribute("complaintList",complaintService.findAll());
        return "complaint/manage_complaint_list";
    }

    @RequestMapping("audit")
    @ResponseBody
    //结果的响应
    public JsonResult audit(long id, int processResult, String processReason, JsonResult result, HttpServletRequest request){
        try{
        	//获取数据
            int userId = (int) request.getSession().getAttribute("userid");
            complaintService.audit(id,userId,processResult,processReason);

            result.setMsg("投诉/申诉处理成功");
        }
        catch (Exception e){
            result.setSuccess(false);
            result.setMsg("处理投诉出错:"+e.getMessage());
        }
        return result;
    }
}
