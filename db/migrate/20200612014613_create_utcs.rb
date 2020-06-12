class CreateUtcs < ActiveRecord::Migration[5.2]
  def change
    create_table :utcs do |t|
      t.string :value

      t.timestamps
    end
  end
end
