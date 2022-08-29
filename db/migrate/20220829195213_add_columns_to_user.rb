class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :dob, :date
    add_column :users, :bio, :text
    add_column :users, :sport_one, :string
    add_column :users, :sport_two, :string
    add_column :users, :sport_three, :string
  end
end
