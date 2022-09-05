class RemoveConfirmationFromInvitations < ActiveRecord::Migration[7.0]
  def change
    remove_column :invitations, :confirmation
  end
end
