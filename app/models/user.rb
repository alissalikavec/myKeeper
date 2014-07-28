class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :bookmarks
  has_many :favorites, dependent: :destroy

   def role?(base_role)
   	role == base_role.to_s
   end

   def favorited(bookmark)
   	self.favorites.where(bookmark_id: bookmark.id).first
   end
end
