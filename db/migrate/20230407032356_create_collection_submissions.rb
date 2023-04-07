class CreateCollectionSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :collection_submissions do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :submission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
