class CreateTransportations < ActiveRecord::Migration
  def change
    create_table :transportations do |t|
      t.string :train_line
      t.string :route
      t.string :run_number
      t.string :operator_id

      t.timestamps null: false
    end
  end
end
