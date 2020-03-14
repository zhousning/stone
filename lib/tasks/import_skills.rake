require 'yaml'
require 'logger'

namespace 'db' do
  desc "import skill"
  task(:import_skills => :environment) do
    import_skills
  end
end

def import_skills
  skills = YAML.load_file("lib/tasks/data/skills.yaml")
  result = []
  skills.each do |s|
    @skill = SkillCtg.where(:name =>  s)
    if @skill.blank?
      SkillCtg.create(:name =>  s)
    else
      next
    end
  end
end
