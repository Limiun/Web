/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

function findPic() {
		   
			var text =CKEDITOR.instances.editor2.getData();
			var reg = /<img.+?src=('|")?([^'"]+)('|")?(?:\s+|>)/gim;  
			var arr = []; 
			while (tem = reg.exec(text)) {  
			        arr.push(tem[2]);  
			   }  
			
			if(arr.length>0){
				 $('#ulid').show('slow');
				 $('#findpic').attr('disabled',"true");
					for(var i=0;i<arr.length;i++){
						  var ul = document.getElementById("ulid");
						  var img = document.createElement("img");
						  img.src = arr[i];
						  img.style.border=1;
						  img.style.width=80+'px';
						  img.style.height=80+'px';
						  img.style.margin=10+'px';
						  img.addEventListener("click",clickPic);
						  ul.appendChild(img);
						  
						}
				 
				 
			}else{
				 alert("请为内容添加图片");
			}
			
			
			function clickPic(e) {  
				   $('#blogBackPic').val("");
		           $('#blogBackPic').val(e.target.src);
		           $('#findpic').removeAttr("disabled");
		           $('#ulid').empty();
		           $('#ulid').toggle("slow");
			}  
			
			
		     	};

(function($) {
App.setPage("forms");  //Set current page
App.init(); //Initialise plugins and elements
$('#ulid').hide();
})(jQuery);