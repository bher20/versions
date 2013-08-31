# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
registered_role = Role.create   :name           => :registered
admin_role = Role.create        :name           => :admin

admin = User.new                :username       => 'admin',
                                :password       => 'secret01',
                                :email          => 'admin@example.com'

admin.roles.push admin_role
admin.skip_confirmation!
admin.save

regular = User.new             :username       => 'user',
                               :password       => 'secret02',
                               :email          => 'user@example.com'

regular.roles.push registered_role
regular.skip_confirmation!
regular.save

app = Application.create        :name           => 'Super Cool App',
                                :comment        => 'This app is so cool!'

app.versions.create             :number         => '1.0.0',
                                :change_log     => ['Added: Cool new icon', 'Changed: Cool sounding name'],
                                :comment        => 'Sweet version',
                                :download_url   => 'http://example.com/downloads/Super_Cool_App-1.0.0.exe',
                                :download_type  => 'exe',
                                :download_size  => '2MB'

app.versions.create             :number         => '1.1.0',
                                :change_log     => ['Added: Cool new icon splash screen'],
                                :comment        => 'Sweet splash screen version',
                                :download_url   => 'http://example.com/downloads/Super_Cool_App-1.1.0.exe',
                                :download_type  => 'exe',
                                :download_size  => '1MB'