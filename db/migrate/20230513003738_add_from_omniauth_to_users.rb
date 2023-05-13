class AddFromOmniauthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :from_omniauth, :boolean
  end
end
