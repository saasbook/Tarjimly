class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :user_tarjimly_id
      t.string :from_language
      t.string :to_language
      t.string :document
      t.string :document_format
      t.datetime :deadline
      t.string :title
      t.string :description
      t.string :categories
      t.integer :num_claims, :default => 0
      t.string :form_type
      t.integer :_status, :default => 0

      t.timestamps
    end
  end
end
