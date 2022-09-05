class AddConfirmationToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :confirmation, :boolean
  end
end
