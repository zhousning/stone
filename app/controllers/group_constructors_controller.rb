class GroupConstructorsController < ApplicationController
  include GroupBase

  def destroy
    destroy_base("Constructor")
  end
end
