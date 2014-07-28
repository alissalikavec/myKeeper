class Bookmark < ActiveRecord::Base
	acts_as_taggable
	belongs_to :user
	has_many :favorites, dependent: :destroy
	default_scope {order('created_at DESC')}
end
