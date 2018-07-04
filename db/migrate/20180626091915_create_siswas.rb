class CreateSiswas < ActiveRecord::Migration[5.2]
  def change
    create_table :siswas do |t|
      t.string :nama
      t.string :jenis_kelamin
      t.string :nisn
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.string :sekolah_asal
      t.string :no_un
      t.string :nama_ortu
      t.string :no_hp

      t.timestamps
    end
    add_index :siswas, :nisn,  unique: true
    add_index :siswas, :no_un, unique: true
  end
end
