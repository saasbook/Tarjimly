class AddTranslatorEmailToClaims < ActiveRecord::Migration[6.0]
  def change
    add_column :claims, :email, :string
  end
end
