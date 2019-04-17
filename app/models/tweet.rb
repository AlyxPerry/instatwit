class Tweet < ApplicationRecord

	belongs_to :user
	has_many :tweet_tags
	has_many :tags, through: :tweet_tags

	mount_uploader :image, TweetImageUploader

	before_validation :link_check, on: :create

	validates :message, presence: true
	validates :message, length: {maximum: 140, too_long: "A tweet is 140 characters!"}, on: :create

	after_validation :apply_link, on: :create
	
	private

	def link_check
		found_link = false
		if (self.message.include?("http://") || self.message.include?("https://"))
			found_link = true
		end
		
		if found_link
			arr = self.message.split
			arr.each_with_index do |word, index|
				if word.include?("http")
					self.link = word
					if word.length > 23
						arr[index] = word[0..22]
					end
				end
			end

		self.message = arr.join(" ")
		end
	end

	def apply_link
		arr = self.message.split

		index = arr.map{|x| x.include? "http"}.index(true)

		if index
			url = arr[index]
			arr[index] = "<a href='#{self.link}' target='_blank'>#{url}</a>"
		end

		self.message = arr.join(" ")
	end

end
