class SiswasController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :show, :edit, :destroy]

	def index
		@siswas = Siswa.all
		respond_to do |format|
			format.html
			format.csv { send_data @siswas.to_csv(['no_un', 'nisn', 'nama', 'jenis_kelamin', 'tempat_lahir', 'tanggal_lahir', 'sekolah_asal', 'nama_ortu', 'no_hp'])}
			format.json { render json: SiswasDatatable.new(view_context) }
		end
	end

	def show
		@siswa = Siswa.find(params[:id])
		respond_to do |format|
			format.html
			format.pdf do
				pdf = SiswaPdf.new(@siswa)
				send_data pdf.render,
							filename: "#{@siswa.nama}",
          					type: 'application/pdf',
          					disposition: 'inline'
			end
		end
	end

	def new
		@siswa = Siswa.new
	end

	def create
		@siswa = Siswa.new(resource_params, jenis_kelamin)
		@siswa.save
		flash[:notice] = 'Data Siswa baru berhasil ditambahkan'
		redirect_to siswas_path
	end


	def edit
		@siswa = Siswa.find(params[:id])
	end

	def update
		@siswa = Siswa.find(params[:id])
		flash[:notice] = 'Data siswa baru berhasil diperbaharui'
		redirect_to siswa_path(@siswa)
	end

	def destroy
		@siswa = Siswa.find(params[:id])
		@siswa.destroy
		flash[:notice] = 'Data siswa baru berhasil dihapus'
		redirect_to siswas_path()
	end


	def import
		Siswa.import(params[:file])
		redirect_to root_url, notice: "Siswa berhasil diimport"
	end


	private

	def resource_params
		params.require(:siswa).permit(:nama, :jenis_kelamin, :nisn, :tempat_lahir, :tanggal_lahir, :sekolah_asal, :no_un, :nama_ortu, :no_hp)
	end

	def jenis_kelamin
		params[:jenis_kelamin].to_i
	end
end