class Project < ActiveRecord::Base

  belongs_to :project_group, :dependent => :destroy

  has_many :project_tables, :dependent => :destroy
  accepts_nested_attributes_for :project_tables, reject_if: :all_blank, allow_destroy: true

end



# == Schema Information
#
# Table name: projects
#
#  id                   :integer         not null, primary key
#  name                 :string          default(""), not null
#  itemname             :string          default(""), not null
#  dep_prj              :string          default(""), not null
#  cstr                 :string          default(""), not null
#  carry                :string          default(""), not null
#  survey               :string          default(""), not null
#  design               :string          default(""), not null
#  control              :string          default(""), not null
#  detect               :string          default(""), not null
#  monitor              :string          default(""), not null
#  domain               :string          default(""), not null
#  major                :string          default(""), not null
#  agent                :string          default(""), not null
#  plan_permit          :string          default(""), not null
#  carry_permit         :string          default(""), not null
#  monitor_permit       :string          default(""), not null
#  cstr_agent           :string          default(""), not null
#  receive_leader       :string          default(""), not null
#  receive_operator     :string          default(""), not null
#  general_supervisor   :string          default(""), not null
#  prfs_supervisor      :string          default(""), not null
#  supervisor           :string          default(""), not null
#  supervising_engineer :string          default(""), not null
#  technical_director   :string          default(""), not null
#  project_manager      :string          default(""), not null
#  subctr_manager       :string          default(""), not null
#  cstr_foreman         :string          default(""), not null
#  constructors         :string          default(""), not null
#  quality_worker       :string          default(""), not null
#  inspector            :string          default(""), not null
#  test_person          :string          default(""), not null
#  detect_person        :string          default(""), not null
#  auditor              :string          default(""), not null
#  reviewer             :string          default(""), not null
#  tester               :string          default(""), not null
#  issuer               :string          default(""), not null
#  examiner             :string          default(""), not null
#  calculator           :string          default(""), not null
#  recorder             :string          default(""), not null
#  surveyor             :string          default(""), not null
#  filler               :string          default(""), not null
#  operator             :string          default(""), not null
#  equipment            :string          default(""), not null
#  address              :string          default(""), not null
#  structor             :string          default(""), not null
#  layer_number         :string          default(""), not null
#  prj_category         :string          default(""), not null
#  prj_scale            :string          default(""), not null
#  start                :string          default(""), not null
#  end                  :string          default(""), not null
#  review_unit          :string          default(""), not null
#  review_permission    :string          default(""), not null
#  measure_cert         :string          default(""), not null
#  supervision_no       :string          default(""), not null
#  quality_info         :string          default(""), not null
#  regist_no            :string          default(""), not null
#  prj_designer         :string          default(""), not null
#  geo_prospect         :string          default(""), not null
#  prj_manager          :string          default(""), not null
#  status               :string          default("新用户"), not null
#  creator              :integer
#  project_group_id     :integer
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

