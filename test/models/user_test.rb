require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "A user should enter a first name" do
		user = User.new
		assert  !user.save
		assert 	!user.errors[:first_name].empty?
	end

	test "A user should enter a last name" do
		user = User.new
		assert  !user.save
		assert 	!user.errors[:first_name].empty?
	end

	test "A user should enter a profile name" do
		user = User.new
		assert  !user.save
		assert 	!user.errors[:profile_name].empty?
	end

	test "A user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:mark).profile_name
		assert  !user.save
		assert 	!user.errors[:profile_name].empty?
	end

	test "A user should have a profile name without spaces" do
		user = User.new
		user.profile_name = "My Profile With Spaces"
		assert  !user.save
		assert 	!user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "A user can have a correctly formatted profile name" do
		user = User.new( first_name: 'Mark', last_name: 'Lai', email: 'mark.lai2@netccentric.com')
		user.password = user.password_confirmation = "asdfasdf"
		user.profile_name = "marklai_1"
		assert user.valid?
	end

end
