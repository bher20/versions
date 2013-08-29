# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.new                :username       => 'admin',
                                :email          => 'admin@example.com',
                                :password       => 'secret'

admin.skip_confirmation!
admin.update_attribute :admin, true
admin.save

app = Application.create        :name           => 'Super Cool App',
                                :comment        => 'This app is so cool!'

app.versions.create             :number         => '1.0.0',
                                :change_log     => ['Added: Cool new icon', 'Changed: Cool sounding name'],
                                :comment        => 'Sweet version',
                                :url            => 'http://example.com/downloads/Super_Cool_App-1.0.0.exe'

app.versions.create             :number         => '1.1.0',
                                :change_log     => ['Added: Cool new icon splash screen'],
                                :comment        => 'Sweet splash screen version',
                                :url            => 'http://example.com/downloads/Super_Cool_App-1.1.0.exe'