class Vehicle < ApplicationRecord

    belongs_to :user
    validates :number,:car_model_name, presence: true
    validates :number, uniqueness: {case_sensitive: false}
    
end
