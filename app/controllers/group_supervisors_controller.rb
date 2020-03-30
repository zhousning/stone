class GroupSupervisorsController < ApplicationController
  include GroupBase

  def destroy
    destroy_base("Supervisor")
  end
end
