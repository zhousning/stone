$(".labours").ready(function() {
  /*$( "#dropdown" ).select2({
        theme: "bootstrap"
  });*/
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

  $(".cert-level-select").change(function() {
    var that = $(this)
    var level = that.val();
    var cert = $(that.siblings(".hidden-cert")[0]) 
    var certVal = $(that.siblings(".cert-val")[0]) 
    var certCtn = $(that.parents(".cert-ctn")[0])
    var certName = $(certCtn.find(".cert-name")[0])
    if (level != "0") {
      certName.addClass("bg-success");
      cert.val(certVal.val() + "," + level);
    } else {
      certName.removeClass("bg-success");
      cert.val(certVal.val());
    }
  })

});
