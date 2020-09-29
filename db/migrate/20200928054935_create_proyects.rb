class CreateProyects < ActiveRecord::Migration[5.2]
  def change
    create_table :proyects do |t|
      t.string :nombre
      t.text :desc
      t.date :fecha_inicio
      t.date :fecha_termino
      t.integer :estado, default: 0

      t.timestamps
    end
  end
end
