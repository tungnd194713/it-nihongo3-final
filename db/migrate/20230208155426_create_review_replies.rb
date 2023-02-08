class CreateReviewReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :review_replies do |t|
      t.integer :review_id
      t.text :comment

      t.timestamps
    end
  end
end
