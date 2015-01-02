class User < ActiveRecord::Base
	attr_accessor :password_confirmation
  
	validates_confirmation_of :password, message:"Passwords do not match"
	
	validates :name, uniqueness:true, presence:true, length: { minimum:3, maximum:16 }
	validates :password, presence:true, confirmation:true, length: { minimum:7, maximum:26 }
end
