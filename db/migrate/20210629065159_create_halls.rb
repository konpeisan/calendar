class CreateHalls < ActiveRecord::Migration[6.0]
  def change
    create_table :halls do |t|
      t.string         :store
      t.timestamps
    end
  end
end
