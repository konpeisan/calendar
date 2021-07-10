class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string        :type_name,       null: false
      t.string        :pachi_slot,      null: false
      t.string        :kind,            null: false
      t.timestamps
    end
  end
end
