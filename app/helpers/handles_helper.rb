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

  def options_for_arct_level(level) 
    levels = [Setting.arct_ctgs.level_one, Setting.arct_ctgs.level_two, Setting.arct_ctgs.level_three]

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
