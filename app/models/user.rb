# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  phone                  :string           default(""), not null
#  name                   :string           default(""), not null
#  identity               :string           default(""), not null
#  alipay                 :string           default(""), not null
#  status                 :integer          default(0), not null
#  number                 :string           default(""), not null
#  authc_number           :string
#  qr_code_uid            :string
#  inviter                :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  parent_id              :integer
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  role_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  rolify
  dragonfly_accessor :qr_code

  has_one :account
  has_one :general_profile
  has_one :construct_profile

  has_many :consumes
  has_many :orders

  has_many :user_domains, :dependent => :destroy
  has_many :domains, :through => :user_domains
  
  has_many :user_majors, :dependent => :destroy
  has_many :majors, :through => :user_majors

  belongs_to :role

  #has_many :users
  #belongs_to :parent,   :class_name => 'User'
  #has_many   :children, :class_name => 'User', :foreign_key => 'parent_id'

  validates_uniqueness_of :phone

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def email_required?
    false
  end

  #before_create :build_default_data
  #def build_default_data
  #  build_account
  #end

  #before_save :store_unique_number
  #def store_unique_number
  #  if self.number == ""
  #    self.number = Time.now.to_i.to_s + "%04d" % [rand(10000)]
  #  end
  #end

  #after_create :set_qrcode
  #def set_qrcode
  #  invite_link = Rails.application.routes.url_helpers.new_user_registration_url(:host => Setting.systems.host, :inviter=>self.number)
  #  qr_code_img = RQRCode::QRCode.new(invite_link).to_img.resize(300, 300)
  #  update_attribute :qr_code, qr_code_img.to_string
  #end

  #STATUS = %w(opening, pending, rejected, passed)
  #STATUS_CODE = %w(0, 1, 2, 3)
  ##validates_inclusion_of :status, :in => STATUS_CODE

  #STATUS.each do |status|
  #  define_method "#{status}?" do
  #    self.status == Setting.users.status
  #  end
  #end

  #def state
  #  if self.status == Setting.users.opening
  #    Setting.users.opening_title
  #  elsif self.status == Setting.users.pending
  #    Setting.users.pending_title
  #  elsif self.status == Setting.users.rejected
  #    Setting.users.rejected_title
  #  elsif self.status == Setting.users.passed
  #    Setting.users.passed_title
  #  end
  #end

  def produce_authc
    update_attribute :authc_number, Time.now.to_i.to_s + "%04d" % [rand(10000)]
  end

  def user_status(value)
  end

  def pend
    update_attribute :status, Setting.users.pending
  end

  def pass
    update_attribute :status, Setting.users.passed
  end

  def reject
    update_attribute :status, Setting.users.rejected
  end

  #不要将assign_default_role放在rolify之前,不然会被执行两次
  after_create :assign_default_role

  def super_admin?
    self.has_role? Setting.roles.super_admin
  end

  def set_roles(roles)
    self.roles = Role.where(:id => roles)
  end

  def set_profile
    if self.has_role? Setting.roles.build
      build_construct_profile
    else
      build_general_profile
    end
  end

  def assign_default_role
    #self.add_role Setting.roles.buyer
  end

  #def create_tree_leaf
  #  Tree.create(:user => self)
  #  Leaf.create(:user => self)
  #end
end
