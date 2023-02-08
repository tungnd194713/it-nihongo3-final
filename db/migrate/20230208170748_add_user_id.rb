class AddUserId < ActiveRecord::Migration[5.1]
  def change
    add_column :review_replies, :user_id, :integer
  end
end
