
package com.SLJMH.controller;


import com.SLJMH.dto.JsonResult;
import com.SLJMH.entity.Complaint;
import com.SLJMH.entity.ComplaintProcessLog;
import com.SLJMH.service.ComplaintProcessLogService;
import com.SLJMH.service.ComplaintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 用户投诉controller
 */
@Controller
@RequestMapping("/user/complaint")
public class UserComplaintController {

    @Autowired
    private ComplaintService complaintService;

    @Autowired
    private ComplaintProcessLogService processLogService;


    @RequestMapping("complaintList")
    public String complaintList(HttpServletRequest request, Model model){
        long userId = (int)request.getSession().getAttribute("userid");
        
        model.addAttribute("complaints",complaintService.findByComplaintedUserId(userId));
        model.addAttribute("currUserId",userId);
        model.addAttribute("currUserName",request.getSession().getAttribute("userName"));
        return "complaint/complaint_list";
    }


    @RequestMapping("createComplaint")
    @ResponseBody
    public JsonResult createComplaint(Complaint complaint,HttpServletRequest request,JsonResult result){
        try{
            long userId = (int)request.getSession().getAttribute("userid");
            complaint.setUserId(userId);
           
            complaintService.createComplaint(complaint);
            result.setMsg("投诉提交成功");
        }
        catch (Exception e){
            result.setMsg("提交投诉出错:"+e.getMessage());
            result.setSuccess(false);
        }

        return result;
    }

    @RequestMapping("getProcessLogList")
    public String getProcessLogList(long complaintId,Model model){
        List<ComplaintProcessLog> processLogList = processLogService.findByComplaintId(complaintId);
        model.addAttribute("processLogList",processLogList);
        return "complaint/process_log_list";
    }

    @RequestMapping("appeal")
    @ResponseBody
    public JsonResult appeal(long id,String appealReason,JsonResult result){
        try{
            complaintService.appeal(id,appealReason);
            result.setMsg("申诉提交成功");
        }
        catch (Exception e){
            result.setSuccess(false);
            result.setMsg("申述出错:"+e.getMessage());
        }

        return result;
    }






}
