class CreateProps < ActiveRecord::Migration
  def change
    create_table :props do |t|
      t.string :rating
      t.references :user, index: true
      t.references :profession, index: true

      t.timestamps
    end
  end
end
