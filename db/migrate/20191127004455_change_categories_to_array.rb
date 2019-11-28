class ChangeCategoriesToArray < ActiveRecord::Migration[6.0]
  def change
    change_column :requests, :categories, "varchar[] USING (string_to_array(categories, ','))"
  end
end
