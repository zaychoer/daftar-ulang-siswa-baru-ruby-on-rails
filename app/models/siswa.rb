class Siswa < ApplicationRecord
	# enum jenis_kelamin: {P: 0, L: 1}
	def self.to_csv(fields = column_names, options = {})
		CSV.generate(options) do |csv|
			csv << fields
			all.each do |siswa|
				csv << siswa.attributes.values_at(*fields)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			siswa_hash = row.to_hash
			siswa = find_or_create_by!(nama: siswa_hash['nama'], nisn: siswa_hash['nisn'], no_un: siswa_hash['no_un'])
			# siswa.update_attributes(siswa_hash)
		end
	end
end
