

var setting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			view: {
				dblClickExpand: false
			},
			data: {
				key : {  //节点数据
					  checked : "checked",//zTree 节点数据中保存 check 状态的属性名称。
					  name : "menuName",//zTree 节点数据保存节点名称的属性名称。
					},
				simpleData: {
					enable: true,
					idKey : "menuId",
					pIdKey : "menuFather",
				}
			},
			callback: {
				onClick: onClick,
				onCheck: onCheck
			}
		};
      
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}

		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].menuId + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
		}
		 
		  
		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
		
		}
		 
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!( event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
		
		var zNodes=null;		
		function menuAjax(){
			$.ajax({
	            type : "post",     
	            url : "<%=basePath%>MenuServlet?menu=ajax", 
	            dataType : "json",
	            async:false,
	            success : function(Result) {
	            	zNodes=Result;
	            },
	            error : function(xhr, status, errMsg){
	                 alert("数据传输失败!"+xhr+status+errMsg);
	            }
	        });
		}
		
		$(document).ready(function(){
			menuAjax();
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#menuContent").hide();
		});
		
		
		function sureDelete(){
	    	 var r=confirm("确定删除(若菜单包含子菜单也将全部删除)？");
	    	  if (r==true) {
	    		   return true;
	    	    }
	    	  else{
	    		  return false;
	    	    }
	    	
	     };
	     
	     
	     function getData(id,name,url,order){
	    	   $("#menuUpdateForm").find("#menuId").val(id);
	    	   $("#menuUpdateForm").find("#menuName").val(name);
	    	   $("#menuUpdateForm").find("#menuUrl").val(url);
	    	   $("#menuUpdateForm").find("#menuOrder").val(order);
	     };
	     
	     (function() {		
				App.setPage("dynamic_table");  //Set current page
				App.init(); //Initialise plugins and elements
			})(jQuery);
		
		
		
		
		
		
		