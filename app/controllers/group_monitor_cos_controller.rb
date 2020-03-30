class GroupMonitorCosController < ApplicationController
  include GroupBase

  def destroy
    destroy_base("MonitorCo")
  end
end
