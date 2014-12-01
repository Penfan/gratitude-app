class Thank < ActiveRecord::Base
    belongs_to :user
    has_many :groups
    has_many :users, through: :groups
    self.per_page = 10
end
