class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :follower_follows, class_name: "Following", foreign_key: :followee_id
  has_many :followers, through: :follower_follows, source: :follower
  has_many :followee_follows, class_name: "Following", foreign_key: :follower_id
  has_many :followees, through: :followee_follows, source: :followee

  validates :name, presence: true

  def self.find_all_by(search)
    self.all.select { |name| name.name === search}
  end
end
