class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.date         :start_time
      t.string       :price,           null: false
      t.string       :recovery,        null: false
      t.string       :total
      t.text         :memo
      t.integer      :store_id
      t.integer      :type_name_id
      t.time         :game_time
      t.timestamps
    end
  end
end
