# class Topic < ActiveRecord::Base
#   has_many :resources
#   belongs_to :topictag
#   validates :name, presence: true
#   validates :opinion, presence: true, length: { minimum: 10 }

#   def add_resource!(resource_attributes)
#     url = resource_attributes[:url]
#     difficulty = resource_attributes[:difficulty]
#     Resource.create!(topic_id: self.id, url: url, difficulty: difficulty)
#   end
# end

