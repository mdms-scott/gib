# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

subforum = Subforum.create!(
  :title => 'Public Forum',
  :description => 'This is the public forum for testing',
  :is_private => '0'
)

subforum = Subforum.create!(
  :title => 'Private Forum',
  :description => 'This is the private forum for testing',
  :is_private => '1'
)