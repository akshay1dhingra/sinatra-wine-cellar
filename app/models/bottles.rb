class Bottle < ActiveRecord::Base 
    belongs_to :user

    validates :name, :type, :year, :location, presence: true

end 