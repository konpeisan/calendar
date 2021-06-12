class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.datetime     :start_time
      t.string       :price,           null: false
      t.string       :recovery,        null: false
      t.integer      :yen_id,          null: false
      t.string       :sum
      t.text         :memo
      t.timestamps
    end
  end
end
