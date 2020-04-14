$(".project_tables").ready(function() {
  if ( $("body.project_tables").length>0 ) {
    $("form.edit_project_table").submit(function(e) {
      $(".project-table-page-ctn").each(function() {
        var that = this;
        var html = "";
        var hidden = $(that).find("input[type='hidden']")[0];
        $(that).find(".nested-fields [class*=Section]").each(function() {
          var section = this;
          html += $(section).prop("outerHTML");
        });
        $(hidden).attr('value', html);
      });
    });
  }
});
