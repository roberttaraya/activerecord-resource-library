require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources
  has_many :tags, :through => :topic_tags
  has_many :topic_tags
  validates :name, presence: true
  validates :opinion, presence: true, length: { minimum: 10 }

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource_attributes)
    url = resource_attributes[:url]
    difficulty = resource_attributes[:difficulty]
    Resource.create!(topic_id: self.id, url: url, difficulty: difficulty)
  end
end

class Resource < ActiveRecord::Base
  belongs_to :topic
  validates :url, format: { with: /(https?:\/\/)(\w{1,}\.)?\w{1,}\.\w{2,}\/?/ }, presence: true
  validates :topic_id, numericality: true, presence: true
  validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }
end

class TopicTag < ActiveRecord::Base
  validates :topic_id, uniqueness: { scope: :tag_id }
  attr_accessor :topic_id

end

class Tag < ActiveRecord::Base
  has_many :topics, :through => :topic_tags
  has_many :topic_tags
  validates :name, uniqueness: true
  validates :name, presence: true
end
