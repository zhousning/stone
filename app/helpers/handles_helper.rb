module HandlesHelper

  def options_for_cert_dept
    [
      [Setting.projects.carry, Setting.projects.carry],
      [Setting.projects.control, Setting.projects.control],
      [Setting.projects.design, Setting.projects.design],
      [Setting.projects.prospect, Setting.projects.prospect],
      [Setting.projects.price, Setting.projects.price],
      [Setting.projects.safe, Setting.projects.safe]
    ]
  end

  def options_for_cert_level
    [
      [Setting.handle_certs.level_a, Setting.handle_certs.level_a],
      [Setting.handle_certs.level_b, Setting.handle_certs.level_b],
      [Setting.handle_certs.level_c, Setting.handle_certs.level_c],
      [Setting.handle_certs.level_none, Setting.handle_certs.level_none]
    ]
  end

  def options_for_number_level(level) 
    levels = [Setting.number_levels.level_one, Setting.number_levels.level_two, Setting.number_levels.level_three]

    str = "<option value='0'>无</option>"
    if !level.nil? && levels.include?(level) 
      str += "<option selected='selected' value='" + level + "'>" + level + "</option>"
    end
    ls = levels.reject do |l|
      l == level
    end
    ls.each do |item|
        str += "<option value='" + item + "'>" + item + "</option>"
    end
    raw(str)
  end

  def options_for_desc_level(level) 
    levels = [Setting.desc_levels.level_one, Setting.desc_levels.level_two, Setting.desc_levels.level_three]

    str = "<option value='0'>无</option>"
    if !level.nil? && levels.include?(level) 
      str += "<option selected='selected' value='" + level + "'>" + level + "</option>"
    end
    ls = levels.reject do |l|
      l == level
    end
    ls.each do |item|
        str += "<option value='" + item + "'>" + item + "</option>"
    end
    raw(str)
  end

  def options_for_prf_level(level) 
    levels = [Setting.prf_ctgs.level_one, Setting.prf_ctgs.level_two]

    str = "<option value='0'>无</option>"
    if !level.nil? && levels.include?(level) 
      str += "<option selected='selected' value='" + level + "'>" + level + "</option>"
    end
    ls = levels.reject do |l|
      l == level
    end
    ls.each do |item|
        str += "<option value='" + item + "'>" + item + "</option>"
    end
    raw(str)
  end

  def options_for_hdct_level(level) 
    levels = [Setting.hdct_ctgs.level_one, Setting.hdct_ctgs.level_two]

    str = "<option value='0'>无</option>"
    if !level.nil? && levels.include?(level) 
      str += "<option selected='selected' value='" + level + "'>" + level + "</option>"
    end
    ls = levels.reject do |l|
      l == level
    end
    ls.each do |item|
        str += "<option value='" + item + "'>" + item + "</option>"
    end
    raw(str)
  end
end  
