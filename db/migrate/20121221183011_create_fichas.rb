class CreateFichas < ActiveRecord::Migration
  def change
    create_table :fichas do |t|
      t.string :nome
      t.string :numero_ordem
      t.date :admissao
      t.date :dispensa

      t.timestamps
    end
  end
end
