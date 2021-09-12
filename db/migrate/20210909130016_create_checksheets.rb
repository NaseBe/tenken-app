class CreateChecksheets < ActiveRecord::Migration[6.0]
  def change
    create_table :checksheets do |t|
      t.integer :classroom_id, null: false
      t.string :projector
      t.string :control_panel
      t.string :mic
      t.string :pc
      t.string :bd_dvd_player
      t.string :remotes
      t.string :ohc
      t.string :screen
      t.string :ports
      t.string :cables
      t.string :expendables
      t.text :details
      t.string :staff, null: false
      t.string :helper
      t.date :date, null: false
      t.string :status, null: false
      t.references :tenken, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
