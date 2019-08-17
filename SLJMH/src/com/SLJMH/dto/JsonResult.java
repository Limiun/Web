
package com.SLJMH.dto;


import java.util.HashMap;
import java.util.Map;

/**
 * Json 响应
 */
public class JsonResult {

    /**
     * 成功标识
     */
    private boolean success = true;

    /**
     * 提示
     */
    private String msg;

    /**
     * 数据
     */
    private Map<String,String> data = new HashMap<>();

    public JsonResult() {
    }

    public JsonResult(boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    public JsonResult(boolean success, String msg, Map<String, String> data) {
        this.success = success;
        this.msg = msg;
        this.data = data;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, String> getData() {
        return data;
    }

    public void setData(Map<String, String> data) {
        this.data = data;
    }
}
