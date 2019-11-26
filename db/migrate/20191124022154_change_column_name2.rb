class ChangeColumnName2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :claims, :translation_type, :translation_format
  end
end
