class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.string :title
      t.string :url
      t.text :notes
      t.belongs_to :user, foreign_key: true
      t.belongs_to :collection, foreign_key: true

      t.timestamps
    end
  end
end
