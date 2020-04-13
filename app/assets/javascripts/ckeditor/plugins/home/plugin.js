(function(){
    //Section 1 : 按下自定义按钮时执行的代码
    var a= {
        exec:function(editor){
          location.href = "/table_templates";
        }
    },
    //Section 2 : 创建自定义按钮、绑定方法
    b='home';
    CKEDITOR.plugins.add(b,{
        init:function(editor){
            editor.addCommand(b,a);
            editor.ui.addButton('home',{
                label:'返回',
                icon: this.path + 'home.png',
                command:b
            });
        }
    });
})();
