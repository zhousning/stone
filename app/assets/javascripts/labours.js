$(".labours").ready(function() {
  $(".domain-level-select").change(function() {
    var that = $(this)
    var level = that.val();
    var domain = $(that.siblings(".hidden-domain")[0]) 
    var domainVal = $(that.siblings(".domain-val")[0]) 
    var domainCtn = $(that.parents(".domain-ctn")[0])
    var domainName = $(domainCtn.find(".domain-name")[0])
    if (level != "0") {
      domainName.addClass("bg-success");
      domain.val(domainVal.val() + "," + level);
    } else {
      domainName.removeClass("bg-success");
      domain.val(domainVal.val());
    }
  })

  $(".major-level-select").change(function() {
    var that = $(this)
    var level = that.val();
    var major = $(that.siblings(".hidden-major")[0]) 
    var majorVal = $(that.siblings(".major-val")[0]) 
    var majorCtn = $(that.parents(".major-ctn")[0])
    var majorName = $(majorCtn.find(".major-name")[0])
    if (level != "0") {
      majorName.addClass("bg-success");
      major.val(majorVal.val() + "," + level);
    } else {
      majorName.removeClass("bg-success");
      major.val(majorVal.val());
    }
  })

  $(".arct-level-select").change(function() {
    var that = $(this)
    var level = that.val();
    var arct = $(that.siblings(".hidden-arct")[0]) 
    var arctVal = $(that.siblings(".arct-val")[0]) 
    var arctCtn = $(that.parents(".arct-ctn")[0])
    var arctName = $(arctCtn.find(".arct-name")[0])
    if (level != "0") {
      arctName.addClass("bg-success");
      arct.val(arctVal.val() + "," + level);
    } else {
      arctName.removeClass("bg-success");
      arct.val(arctVal.val());
    }
  })
});
