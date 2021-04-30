class Book < ApplicationRecord

belongs_to :user
has_many :likes, dependent: :destroy

def liked_by?(user)
    self.likes.where(user_id: user.id).exists?
end

 validates :title, presence: true
 validates :body, presence: true, length: {maximum: 200}


end
