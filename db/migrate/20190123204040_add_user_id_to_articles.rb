class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def up
    add_column :articles, :user_id, :integer
  end

  def down
    remove_column :articles, :user_id, :integer
  end
end
