class AddTimeoutToUser < ActiveRecord::Migration
  def change
    add_column :users, :timeout, :integer, default: 10
  end
end
