class GroupLaboursController < ApplicationController
  include GroupBase

  def destroy
    destroy_base("Labour")
  end
end
