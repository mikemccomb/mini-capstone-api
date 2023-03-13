class AddAdminToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :admin, :boolean, default: false
  end
end
