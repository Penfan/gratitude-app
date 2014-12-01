class Thank < ActiveRecord::Base
    belongs_to :user
    has_many :groups
    has_many :users, through: :groups, class_name: "User"
    self.per_page = 10
end
