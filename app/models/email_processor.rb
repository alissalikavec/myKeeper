class EmailProcessor
	#http://sendgrid.com/blog/receiving-email-in-your-rails-app-with-griddler/
	def self.process(email)
		self.create_bookmark(email)
	end

	def self.create_bookmark(email)
		@title = email.body
		self.get_user_id(email)
		Bookmark.create!({ title: @title, tag_list: email.body })
	end

	def self.get_user_id(email)
		@user_id = User.find_by_email(email.from).id
	end
end