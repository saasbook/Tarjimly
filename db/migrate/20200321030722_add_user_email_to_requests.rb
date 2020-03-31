class AddUserEmailToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :email, :string
  end
end
