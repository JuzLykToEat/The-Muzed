class Teachers::RegistrationsController < Devise::RegistrationsController
  before_action :change_params, only: :create

  private

  def change_params
    params[:teacher][:languages] = params[:teacher][:languages].join(", ")
  end

  # def sign_up_params
  #   params.require(:teacher).permit(:email, :password, :password_confirmation, :ages_taught, :languages, :lesson_locations, :teaching_statement, :biography, :education, :address, :teach_special_needs, :active)
  # end
  #
  # def account_update_params
  #   params.require(:teacher).permit(:email, :password, :password_confirmation, :current_password)
  # end

end
