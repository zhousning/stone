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
end  
