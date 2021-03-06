class CreateUpvotes < ActiveRecord::Migration[6.0]
  def change
    create_table :upvotes do |t|
      t.integer :click
      t.belongs_to :user, foreign_key: true
      t.belongs_to :submission, foreign_key: true

      t.timestamps
    end
  end
end
