$(".projects").ready(function() {
  var tables = gon.tables;
    var groupDataArray1 = tables["tables"];

    var settings3 = {
        "groupDataArray": groupDataArray1,
        "groupItemName": "groupName",
        "groupArrayName": "groupData",
        "itemName": "name",
        "valueName": "value",
        "callable": function (items) {
            console.dir(items)
        }
    };

    $("#transfer3").transfer(settings3);

    $(".save-my-table").click(function() {
      var arr = []
      $(".transfer-double-selected-list-li input[type='checkbox']").each(function() {
        var that = this;
        var val = $(that).val();
        arr.push(val);
      });
      if (arr.length == 0) {
        alert("请选择表格");
        return;
      }
      var result = arr.join();
      $.getJSON('/projects/' + gon.project + '/create_my_table', {data: result}, function(res){
        if (res.status == "success") {
          location.href = '/projects/' + gon.project + '/project_tables'
        } else {
          alert("保存失败, 请重新保存");
        }

      });
    })
});
