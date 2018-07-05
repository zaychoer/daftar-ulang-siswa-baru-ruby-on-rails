class ApplicationController < ActionController::Base

	rescue_from ActiveRecord::RecordNotUnique, with: :duplicate_error
	rescue_from I18n::ArgumentError, with: :complete_error

	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :pundit_error
	before_action :configure_permitted_parameters, if: :devise_controller?

	private

	def complete_error
		flash[:warning] = "Data belum lengkap, harap lengkapi data terlebih dahulu."
		redirect_to root_path
	end 

	def duplicate_error
		flash[:danger] = "Mohon maaf data tidak dapat disimpan terjadi duplikasi data No.UN/NISN, harap cek kembali data yang diinput."
		redirect_to edit_siswa_path(@siswa)
	end

	def pundit_error
		flash[:notice] = 'Tidak memiliki hak akses.'
		redirect_to root_path
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
