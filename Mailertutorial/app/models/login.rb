class Login < ActiveRecord::Base
	validates :password, length: { minimum: 5}
end
