class Group < ActiveRecord::Base
    has_and_belongs_to_many :users
    belongs_to :thank
    validates :users, :associated => true
end
