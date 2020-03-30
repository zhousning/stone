# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role = Role.create(:name => Setting.roles.super_admin)

admin_permissions = Permission.create(:name => Setting.permissions.super_admin, :subject_class => Setting.admins.class_name, :action => "manage")

role.permissions << admin_permissions

user = User.new(:phone => Setting.admins.phone, :password => Setting.admins.password, :password_confirmation => Setting.admins.password)
user.save!

user.roles = []
user.roles << role

AdminUser.create!(:phone => Setting.admins.phone, :email => Setting.admins.email, :password => Setting.admins.password, :password_confirmation => Setting.admins.password)

User.create!(:phone => "15763703188", :password => "15763703188", :password_confirmation => "15763703188")


Constructor.create(:company => "constructor1")
Constructor.create(:company => "constructor2")
Constructor.create(:company => "constructor3")

Supervisor.create(:company => "Supervisor1")
Supervisor.create(:company => "Supervisor2")
Supervisor.create(:company => "Supervisor3")

Prospector.create(:company => "Prospector1")
Prospector.create(:company => "Prospector2")
Prospector.create(:company => "Prospector3")

Designer.create(:company => "Designer1")
Designer.create(:company => "Designer2")
Designer.create(:company => "Designer3")

Labour.create(:company => "Labour1")
Labour.create(:company => "Labour2")
Labour.create(:company => "Labour3")

AgentorCo.create(:company => "AgentorCo1")
AgentorCo.create(:company => "AgentorCo2")
AgentorCo.create(:company => "AgentorCo3")

MonitorCo.create(:company => "MonitorCo1")
MonitorCo.create(:company => "MonitorCo2")
MonitorCo.create(:company => "MonitorCo3")

