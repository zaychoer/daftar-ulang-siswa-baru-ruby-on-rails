class ApplicationController < ActionController::Base
	rescue_from ActiveRecord::RecordNotUnique, with: :duplicate_error
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :pundit_error
	before_action :configure_permitted_parameters, if: :devise_controller?

	private 

	def duplicate_error
		flash[:danger] = "Mohon Maaf Data tidak dapat disimpan karena Nomor UN/NISN sudah digunakan"
		redirect_to edit_siswa_path(@siswa)
	end

	def pundit_error
		flash[:notice] = 'Tidak memiliki hak akses'
		redirect_to root_path
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
