class CreateClaims < ActiveRecord::Migration[6.0]
  def change
    create_table :claims do |t|
      t.integer :translator_tarjimly_id, null: false
      t.integer :_status,  :default => 0
      t.datetime :submitted_date
      t.string :translation
      t.string :translation_type

      t.timestamps
    end
  end
end
