class ChangeConfirmationToBoolean < ActiveRecord::Migration[7.0]
  def self.up
    change_table :invitations do |t|
      t.change :confirmation, :string
    end
  end
  def self.down
    change_table :invitations do |t|
      t.change :confirmation, :boolean
    end
  end
end
