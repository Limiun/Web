/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

$(function(){
            var validate = $("#loginForm").validate({
                debug: true, //调试模式取消submit的默认提交功能   
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
                onkeyup: false,   
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
                    form.submit();   //提交表单   
                },   
                rules:{
                	userEmail1:{
                        required:true,
                        email:true
                    },
                    userPassWord1:{
                        required:true                       
                    }                  
                }
                          
            });    
    
        });

        $(function(){
            var validate = $("#regForm").validate({
                debug: true, //调试模式取消submit的默认提交功能   
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
                onkeyup: false,   
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
                    form.submit();   //提交表单   
                },   
                rules:{
                	userName:{
                        required:true,
                    },
                    userNickName:{
                        required:true                       
                    } , 	 
                    userEmail:{
                        required:true,  
                        email:true
                    }, 
                    userPassWord:{
                        required:true                       
                    } ,
                    regRePass:{
                    	required:true,
                    	equalTo:"#userPassWord"                       
                    } 
                }
                          
            });    
    
        });

        $(function(){
            var validate = $("#passForm").validate({
                debug: true, //调试模式取消submit的默认提交功能   
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
                onkeyup: false,   
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
                    form.submit();   //提交表单   
                },   
                rules:{
                		 
                	userEmail:{
                        required:true,  
                        email:true
                    }
                }
               
                          
            });    
    
        });

    function checkEmail()     { 
    	$.ajax({
            type : "post",     
            async: false,
            url : "RegisterServlet?flag=ajax", 
            dataType : "html",
            //data:{"Email":$("#userEmail").val()}, 
            data: "Email=" + $("#userEmail").val(), 
            success : function(Result) {
                 if(Result==""){
                	 return true;
                 }else{
                	 $("#userEmail").val(Result);
                	 return false;
                 }
            },
            error : function(xhr, status, errMsg){
                 alert("数据传输失败!"+xhr+status+errMsg);
            }
        });
    } 

    function checkEmailPass()     {
    	
    	$.ajax({
            type : "post",     
            url : "LoginServlet?flag=ajax", 
            dataType : "html",
            data: "userEmail=" + $("#userEmail1").val()+"&userPassWord="+$("#userPassWord1").val(), 
            success : function(Result) {
                 if(Result!==""){
                	 $("#userEmail1").val(Result);
                 }else{
                	 $("#loginForm").submit();
                 }
            },
            error : function(xhr, status, errMsg){
                 alert("数据传输失败-Login!"+xhr+status+errMsg);
            }
        });
    };
    
   