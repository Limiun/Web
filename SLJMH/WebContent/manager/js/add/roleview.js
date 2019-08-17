

var setting = {
    		check: {
				enable: true,
				chkboxType: {"Y":"", "N":""}
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
				beforeClick: beforeClick,
				onCheck: onCheck
			}
		};
      
        function beforeClick(treeId, treeNode) {
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
		
		
		
		
		 var setting1 = {
		    		check: {
						enable: true,
						chkboxType: {"Y":"", "N":""}
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
						beforeClick: beforeClick1,
						onCheck: onCheck
					}
				};
		      
		        function beforeClick1(treeId, treeNode) {
				var zTree1 = $.fn.zTree.getZTreeObj("treeDemo1");
				zTree1.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
		     	}
		       
				function onCheck(e, treeId, treeNode) {
					var zTree1 = $.fn.zTree.getZTreeObj("treeDemo1"),
					nodes = zTree1.getCheckedNodes(true),
					v = "";
					for (var i=0, l=nodes.length; i<l; i++) {
						v += nodes[i].menuId + ",";
					}
					if (v.length > 0 ) v = v.substring(0, v.length-1);
					var cityObj1 = $("#citySel1");
					cityObj1.attr("value", v);
				}
				 
				  
				function showMenu1() {
					var cityObj1 = $("#citySel1");
					var cityOffset1 = $("#citySel1").offset();
					$("#menuContent1").css({left:cityOffset1.left + "px", top:cityOffset1.top + cityObj1.outerHeight() + "px"}).slideDown("fast");
					$("body").bind("mousedown", onBodyDown);
				
				}
				 
				function hideMenu1() {
					$("#menuContent1").fadeOut("fast");
					$("body").unbind("mousedown", onBodyDown);
				}
				function onBodyDown(event) {
					if (!( event.target.id == "citySel1" || event.target.id == "menuContent1" || $(event.target).parents("#menuContent1").length>0)) {
						hideMenu1();
					}
				}
				
				function getData(id,name,desc,menus){
					var zNodes1=null;
					  $.ajax({
				            type: "post",     
				            url: "<%=basePath%>MenuServlet?menu=ajax", 
				            dataType : "json",
				            async:false,
				            success : function(Result) {
				            	zNodes1=Result;
				            },
				            error : function(xhr, status, errMsg){
				                 alert("数据传输失败!"+xhr+status+errMsg);
				            }
				        });
					//菜单树构建完成
					$.fn.zTree.init($("#treeDemo1"), setting1, zNodes1);
					//得到默认值
				    $("#roleUpdateForm").find("#roleId").val(id);
				    $("#roleUpdateForm").find("#roleName").val(name);
				    $("#roleUpdateForm").find("#roleDesc").val(desc);
				    //设置角色本来的菜单树结构
				    var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
				    //设置角色本来被选中的项
				    var menusArr=new Array();
				    menusArr=menus.substring(1,menus.length-1).split(',');
				    for (var i=0, l=menusArr.length; i < l; i++) {
					 var nodes = treeObj.getNodesByParam("menuId",menusArr[i], null);
					  treeObj.checkNode(nodes[0], true, true);
				    }
				    //对选中的项赋值给citySel1
				    nodes = treeObj.getCheckedNodes(true),
				      v = "";
				     for (var i=0, l=nodes.length; i<l; i++) {
					  v += nodes[i].menuId + ",";
				      }
				     if (v.length > 0 ) v = v.substring(0, v.length-1);
				       var cityObj1 = $("#citySel1");
			           cityObj1.attr("value",v);
				}
				
				
				
				$(document).ready(function(){
					 $("#menuContent1").hide();
				});
				
				
				function sureDelete(){
			    	 var r=confirm("确定删除(若角色包含多个用户也将全部删除)？");
			    	  if (r==true) {
			    		   return true;
			    	    }
			    	  else{
			    		  return false;
			    	    }
			    	
			     };
			     
			     
			     
			     (function($) {		
						App.setPage("dynamic_table");  //Set current page
						App.init(); //Initialise plugins and elements
					})(jQuery);
    
    
    
    
    
    
    
    
    
    