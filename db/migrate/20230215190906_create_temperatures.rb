class CreateTemperatures < ActiveRecord::Migration[7.0]
  def change
    create_table :temperatures do |t|
      # Ability
      t.decimal :value, precision: 10, scale: 1
      t.integer :unix_fixed_at
      t.datetime :fixed_at

      t.timestamps
    end
    add_index :temperatures, :fixed_at, unique: true
  end
end
