class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :email, uniqueness:true
  has_many :thanks
  has_many :comments
  has_and_belongs_to_many :groups

  def visible_thanks(params)
    Group.joins(:user)
    temp = (Thank.where("all_vis = ?", true) + Thank.where("user_id = ?", self)).map(&:id) + self.groups.pluck(:thank_id)
    thanks = Thank.where('id in (?)',temp).uniq.order(created_at: :desc).page(params)
    thanks
  end

  def in_which_groups
    usr_groups = []
    self.thanks.each do |t| 
      usr_groups.append(t.groups)
    end
    usr_groups
  end

  def first_name
    (name.presence || "").split.first
  end

  def last_name
    (name.presence || "").split[1..-1].try(:last)
  end

  def self.next_unique_handle(name)
    first_name, last_name = ((name.presence || '').split.first || ''),
                            ((name.presence || '').split[1..-1].try(:last) || '')

    last_name_initial = last_name.first || ''
    short_name = (first_name + last_name_initial)

    handle = handle_prefix = (short_name.presence || rand(10000).to_i.to_s).parameterize
    [0, rand(100..500).to_i, rand(500..1000).to_i].each do | seed |
      5.times do |i|
        return handle unless User.where(handle: handle).exists?
        handle = "#{handle_prefix}#{seed + i}"
      end
    end
  end

end
