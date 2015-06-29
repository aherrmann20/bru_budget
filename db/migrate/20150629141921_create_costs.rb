class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.float :amount
      t.date :date
      t.string :paid_to
      t.string :paid_for

      t.timestamps null: false
    end
  end
end
