$(".table_templates").ready(function() {
  if ( $("body.table_templates").length>0 ) {
    $(".table-template-status").bootstrapSwitch('state',$(".table-template-status").prop('checked'));

    $('.table-template-status').on('switchChange.bootstrapSwitch', function (event, state) {
      var number = $(this).attr("data-number"), data = 0;
      if (state) {
        data = 1;
      }
      var url = "/table_templates/" + number + "/change_status?data=" + data;
      $.get(url);
    });
  }
});
