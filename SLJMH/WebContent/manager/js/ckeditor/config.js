/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	//config.language = 'fr';
	// config.uiColor = '#red';
	//config.skin='kama';
	//onfig.image_previewText='';
	config.image_previewText = '';
	config.filebrowserImageUploadUrl= '/SLJMH/UploadServlet?file=add&type=blog'; //待会要上传的action或servlet  
	config.filebrowserBrowseUrl = '/SLJMH/UploadServlet?file=list&type=blog'; //上传文件时浏览服务文件夹
    
    config.toolbar = 'Full';     
    config.toolbar_Full =     
    [     
        ['Source','Preview'],     
        ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],     
        ['Undo','Redo','-','Find','Replace','RemoveFormat'],     
        ['Form', 'Checkbox', 'Radio','Select', 'Button', 'ImageButton', 'HiddenField'],     
        ['Bold','Italic','Underline','Strike','Subscript','Superscript','Maximize'],  
        ['Link','Unlink','Anchor'],   
        ['NumberedList','BulletedList','Outdent','Indent','Blockquote'],     
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],     
        ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],     
        ['Styles','Format','Font','FontSize'],     
        ['TextColor','BGColor']
          
    ];     
    
    
    
};

