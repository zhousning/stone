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

  $(".skill-level-select").change(function() {
    var that = $(this)
    var level = that.val();
    var skill = $(that.siblings(".hidden-skill")[0]) 
    var skillVal = $(that.siblings(".skill-val")[0]) 
    var skillCtn = $(that.parents(".skill-ctn")[0])
    var skillName = $(skillCtn.find(".skill-name")[0])
    if (level != "0") {
      skillName.addClass("bg-success");
      skill.val(skillVal.val() + "," + level);
    } else {
      skillName.removeClass("bg-success");
      skill.val(skillVal.val());
    }
  })

  $(".prf-level-select").change(function() {
    var that = $(this)
    var level = that.val();
    var prf = $(that.siblings(".hidden-prf")[0]) 
    var prfVal = $(that.siblings(".prf-val")[0]) 
    var prfCtn = $(that.parents(".prf-ctn")[0])
    var prfName = $(prfCtn.find(".prf-name")[0])
    if (level != "0") {
      prfName.addClass("bg-success");
      prf.val(prfVal.val() + "," + level);
    } else {
      prfName.removeClass("bg-success");
      prf.val(prfVal.val());
    }
  })

  $(".hdct-level-select").change(function() {
    var that = $(this)
    var level = that.val();
    var hdct = $(that.siblings(".hidden-hdct")[0]) 
    var hdctVal = $(that.siblings(".hdct-val")[0]) 
    var hdctCtn = $(that.parents(".hdct-ctn")[0])
    var hdctName = $(hdctCtn.find(".hdct-name")[0])
    if (level != "0") {
      hdctName.addClass("bg-success");
      hdct.val(hdctVal.val() + "," + level);
    } else {
      hdctName.removeClass("bg-success");
      hdct.val(hdctVal.val());
    }
  })
});
