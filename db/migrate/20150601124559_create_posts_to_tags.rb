class CreatePostsToTags < ActiveRecord::Migration
  def change
    create_table :posts_to_tags do |t|
      t.integer :tag_id
      t.integer :post_id
    end
  end
end