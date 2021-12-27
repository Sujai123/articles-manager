class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :config_settings do |t|
      t.string  :name
      t.bigint  :configurable_id
      t.string  :configurable_type
      t.string :type
      t.json :config_value
      t.timestamps
    end

    add_index :config_settings, [:configurable_type, :configurable_id]
  end
end
