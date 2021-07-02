class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string        :type_name
      t.string        :pachi_slot
      t.string        :kind
      t.timestamps
    end
  end
end
