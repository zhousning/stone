class GroupAgentorCosController < ApplicationController
  include GroupBase

  def destroy
    destroy_base("AgentorCo")
  end
end
