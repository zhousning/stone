class GroupProspectorsController < ApplicationController
  include GroupBase

  def destroy
    destroy_base("Prospector")
  end
end
