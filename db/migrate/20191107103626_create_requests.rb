class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :user_tarjimly_id, null: false
      t.string :from_language, null: false
      t.string :to_language, null: false
      t.string :document
      t.string :document_format, null: false
      t.datetime :deadline, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.string :categories
      t.integer :num_claims,  :default => 0
      t.string :form_type
      t.integer :_status,  :default => 0

      t.timestamps
    end
  end
end
