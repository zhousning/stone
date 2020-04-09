CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];
  config.toolbar = "Full";
  config.language = "zh-cn";
  config.bodyClass = "document-editor";
  config.height = "50em";
  //config.fullPage = true;
  config.contentsCss = '/assets/ckeditor/contents.css';
  config.copyFormatting_allowedContexts = ['text', 'lists'];
  config.extraPlugins = 'tableresize,pastefromword';
  config.stylesSet = 'my_styles';


}

  CKEDITOR.stylesSet.add( 'my_styles', [
    { name: '表格边框', element: 'table', styles: { border: '2px solid black', 'border-collapse': 'collapse' } },
    { name: '表格单元格', element: 'p', styles: { border: '1px solid black' } }
    //{ name: 'Red Title',  element: 'h3', styles: { color: 'Red' } },
    //{ name: '表格', element: 'span', attributes: { 'class': 'ckeditor_my_table' } }
    //{ name: 'Marker: Yellow', element: 'span', styles: { 'background-color': 'Yellow' } }
  ]);


