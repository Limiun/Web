

function sureDelete(){
    	 var r=confirm("确定删除(若角色包含多个用户也将全部删除)？");
    	  if (r==true) {
    		   return true;
    	    }
    	  else{
    		  return false;
    	    }
    	
     };
    function getData(id,name,nick,email,pass,pic,identify,truename,birthday,sex,star,blood,cha,hobby,job,reason){
    	    $("#userUpdateForm").find("#userId").val(id);
		    $("#userUpdateForm").find("#userName").val(name);
		    $("#userUpdateForm").find("#userNickName").val(nick);
		    $("#userUpdateForm").find("#userEmail").val(email);
		    $("#userUpdateForm").find("#userPassWord").val(pass);
		    $("#userUpdateForm").find("#userPic").val(pic);
		    $("#userUpdateForm").find("#userIdentify").val(identify);
		    $("#userUpdateForm").find("#userTrueName").val(truename);
		    $("#userUpdateForm").find("#userBirthday").val(birthday);
		    $("#userUpdateForm").find("#userSex").val(sex);
		    $("#userUpdateForm").find("#userStar").val(star);
		    $("#userUpdateForm").find("#userBlood").val(blood);
		    $("#userUpdateForm").find("#userCharacter").val(cha);
		    $("#userUpdateForm").find("#userHobby").val(hobby);
		    $("#userUpdateForm").find("#userJob").val(job);
		    $("#userUpdateForm").find("#userStateReason").val(reason);
    };
    
(function() {		
		App.setPage("dynamic_table");  //Set current page
		App.init(); //Initialise plugins and elements
	})(jQuery);
    
    
    
    
    
    
    
    
    
    