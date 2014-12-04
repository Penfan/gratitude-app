class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :year, numericality: { only_integer: true }
  has_many :thanks
  has_many :comments
  has_and_belongs_to_many :groups
end
