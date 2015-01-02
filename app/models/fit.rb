class Fit < ActiveRecord::Base
	validates :title, presence:true, uniqueness:true, length:{ minimum: 5, maximum: 25}
	validates :description, presence:true, length:{ minimum: 15}
	validates :description, presence:true
	
	has_many :comments, dependent: :destroy
end
