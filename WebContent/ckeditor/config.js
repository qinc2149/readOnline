/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.toolbar = 'MyToolbar';//把默认工具栏改为‘MyToolbar’     
    config.toolbar_MyToolbar =     
    [     
        ['Preview','-','Cut','Copy','Paste','PasteText','PasteFromWord', '-',    
        'Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat','Font','Maximize','JustifyCenter','JustifyLeft','JustifyRight'],     
        ['Table','HorizontalRule','SpecialChar','PageBreak','Styles','Format','FontSize','Bold','Italic','Strike','Link','Unlink']
    ]; 
      
};
