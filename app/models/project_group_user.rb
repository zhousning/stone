class ProjectGroupUser < ActiveRecord::Base
  belongs_to :project_group
  belongs_to :cpt_dep_user
end
