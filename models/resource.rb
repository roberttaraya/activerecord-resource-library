# class Resource < ActiveRecord::Base
#   belongs_to :topic
#   validates :url, format: { with: /(https?:\/\/)(\w{1,}\.)?\w{1,}\.\w{2,}\/?/ }, presence: true
#   validates :topic_id, numericality: true, presence: true
#   validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }
# end

# # Resource.create!(topic_id: 5, url: "http://www.google.com", difficulty: :hard)
# # p Resource.all