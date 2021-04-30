class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable

has_many :books, dependent: :destroy

has_many :relationships, foreign_key: "user_id", dependent: :destroy
has_many :followings, through: :relationships, source: :follow

has_many :passive_relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
has_many :followers, through: :passive_relationships, source: :user

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

attachment :profile_image

 validates :name, presence: true,uniqueness: true, length: {in: 2..20}
 validates :introduction,  length: { maximum: 50 }

end
