class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :requests, :document, :document_text
    rename_column :claims, :translation, :translation_text
  end
end
