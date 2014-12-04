class Thank < ActiveRecord::Base
    belongs_to :user
    has_many :groups
    has_many :users, through: :groups
    validates :text, presence: true
    self.per_page = 10
end
