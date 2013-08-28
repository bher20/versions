# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
profile = Profile.create    :email        => 'bob@mail.com',
                            :first_name   => 'Bob',
                            :last_name    => 'Boberson'

profile.user = User.create  :name         => 'bob',
                            :password     => 'secret'

profile.role = Role.create  :name         => 'administrator',
                            :comment      => 'User is allowed to administer this application.'

app = Application.create    :name         => 'Super Cool App',
                            :comment      => 'This app is so cool!',
                            :user         =>  profile.user

app.versions.create         :number       => '1.0.0',
                            :change_log   => ['Added: Cool new icon', 'Changed: Cool sounding name'],
                            :comment      => 'Sweet version'

app.versions.create         :number       => '1.1.0',
                            :change_log   => ['Added: Cool new icon splash screen'],
                            :comment      => 'Sweet splash screen version'