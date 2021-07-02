class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string        :type_name
      t.string        :pachinko
      t.string        :slot
      t.timestamps
    end
  end
end
