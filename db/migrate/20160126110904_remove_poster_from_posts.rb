class RemovePosterFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :poster, :string
  end
end
