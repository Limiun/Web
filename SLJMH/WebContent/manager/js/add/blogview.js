

function sureDelete(){
    	 var r=confirm("确定删除？");
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