class CreateSiswas < ActiveRecord::Migration[5.2]
  def change
    create_table :siswas do |t|
      t.string :nama
      t.string :jenis_kelamin
      t.string :nisn, length: 10
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.string :sekolah_asal
      t.string :no_un, length: 14
      t.string :nama_ortu
      t.string :no_hp

      t.timestamps
    end
  end
end
