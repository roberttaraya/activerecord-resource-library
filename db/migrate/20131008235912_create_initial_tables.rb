class CreateInitialTables < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.string :name
      t.string :opinion
      t.timestamps
    end

    create_table :resources do |t|
      t.belongs_to :topic
      t.string :url
      t.string :difficulty
      t.timestamps
    end

    create_table :topic_tags, :id => false do |t|
      t.belongs_to :topic
      t.belongs_to :tag
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :topics
    drop_table :topic_tags
    drop_table :tags
    drop_table :resources
  end
end
