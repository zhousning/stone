CKEDITOR.on( 'dialogDefinition', function( ev ) {
  var dialogName = ev.data.name;
  var dialogDefinition = ev.data.definition;

  if ( dialogName == 'table' ) {
    var info = dialogDefinition.getContents( 'info' );

    info.get( 'txtWidth' )[ 'default' ] = '100%';       // Set default width to 100%
    info.get( 'txtBorder' )[ 'default' ] = '2';         // Set default border to 0
  }
});

CKEDITOR.editorConfig = function (config) {

	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'Preview,NewPage,Templates,Find,Replace,SelectAll,Scayt,Form,Radio,TextField,Checkbox,Textarea,Select,Button,ImageButton,HiddenField,NumberedList,BulletedList,Outdent,Indent,Blockquote,CreateDiv,Language,Anchor,Unlink,Link,Flash,HorizontalRule,Smiley,SpecialChar,Iframe,Styles,TextColor,BGColor,ShowBlocks,About,CopyFormatting';

  //文件浏览器
  //config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
  //config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
  //config.filebrowserUploadUrl = "/ckeditor/attachment_files";
  
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

  config.removeDialogTabs = 'image:advanced;link:advanced;table:advanced';

  config.language = "zh-cn";
  config.bodyClass = "document-editor";
  config.height = "50em";
  //config.fullPage = true;
  config.contentsCss = '/assets/ckeditor/contents.css';
  config.copyFormatting_allowedContexts = ['text', 'lists'];
  config.extraPlugins = 'tableresize,pastefromword,image2,uploadimage';
  //config.stylesSet = 'my_styles';

  config.font_names = '宋体/SimSun;楷体/KaiTi;黑体/SimHei;微软雅黑/Microsoft YaHei;' + config.font_names; 

}

  //CKEDITOR.stylesSet.add( 'my_styles', [
  //  { name: '表格边框', element: 'table', styles: { border: '2px solid black', 'border-collapse': 'collapse' } },
  //  { name: '表格单元格', element: 'p', styles: { border: '1px solid black' } }
  //  //{ name: 'Red Title',  element: 'h3', styles: { color: 'Red' } },
  //  //{ name: '表格', element: 'span', attributes: { 'class': 'ckeditor_my_table' } }
  //  //{ name: 'Marker: Yellow', element: 'span', styles: { 'background-color': 'Yellow' } }
  //]);

