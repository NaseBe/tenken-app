class CreateChecksheets < ActiveRecord::Migration[6.0]
  def change
    create_table :checksheets do |t|

      t.timestamps
    end
  end
end
