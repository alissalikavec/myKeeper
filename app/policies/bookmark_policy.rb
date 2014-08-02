class BookmarkPolicy < ApplicationPolicy
	def index?
		true
	end
	def create?
		user.present?
	end
	def update?
		user.present? && user.role?(:admin)
	end
	def show?
		record.public? || user.present? 
	end 
end