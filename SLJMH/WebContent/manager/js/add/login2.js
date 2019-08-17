/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

 function swapScreen(id) {
		jQuery('.visible').removeClass('visible animated fadeInUp');
		jQuery('#'+id).addClass('visible animated fadeInUp');
	};
    
    (function() {		
		App.setPage("login_bg");  //Set current page
		App.init(); //Initialise plugins and elements
	})(jQuery);