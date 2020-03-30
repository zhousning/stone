class GroupDesignersController < ApplicationController
  include GroupBase

  def destroy
    destroy_base("Designer")
  end
end
