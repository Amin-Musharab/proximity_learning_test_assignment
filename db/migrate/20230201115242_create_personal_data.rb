class CreatePersonalData < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_data do |t|
      t.json :personal_info
      t.json :address
      t.string :email
      t.timestamps
    end
  end
end
