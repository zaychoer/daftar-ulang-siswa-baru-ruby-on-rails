class SiswasDatatable < ApplicationDatatable
	delegate :edit_siswa_path, to: :@view
	private

	def data
		siswas.map do |siswa|
			[].tap do |column|
				column << siswa.no_un
				column << siswa.nisn
				column << siswa.nama
				column << siswa.jenis_kelamin
				column << siswa.tempat_lahir
				column << I18n.l(siswa.tanggal_lahir)

				links = []
				links << link_to('Detail', siswa, class: 'btn btn-success btn-sm')
				links << link_to('Edit', edit_siswa_path(siswa), class: 'btn btn-warning btn-sm')
				links << link_to('Hapus', siswa, class: 'btn btn-danger btn-sm', method: :delete, data: { confirm: 'Apakah anda yakin ingin menghapus data siswa tersebut' })
				column << links.join(' | ')
			end
		end
	end

	def count
		Siswa.count
	end

	def total_entries
		siswas.total_count
	end

	def siswas
		@siswas ||= fetch_siswas
	end

	def fetch_siswas
		search_string = []
		columns.each do |term|
			search_string << "#{term} like :search"
		end

		siswas = Siswa.order("#{sort_column} #{sort_direction}")
		siswas = siswas.page(page).per(per_page)
		siswas = siswas.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
	end

	def columns
		%w(no_un nisn nama jenis_kelamin tempat_lahir tanggal_lahir sekolah_asal)
	end
end
