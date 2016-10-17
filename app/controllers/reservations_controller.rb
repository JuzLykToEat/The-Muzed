# class ReservationsController < ApplicationController
# 	before_action :authenticate_user!

# 	def preload
# 		teacher = Teacher.find(params[:teacher_id])
# 		today = Date.today
# 		reservations = teacher.reservations.where("day >= ? OR time >= ?", today, now)

# 		render json: reservations
# 	end

# 	def create
# 		@reservation = current_user.reservations.create(reservation_params)

# 		redirect_to @reservation.teacher, notice: "Your reservation has been created"
# 	end

# 	private
# 		def reservation_params
# 			params.require(:reservation).permit(:day, :time, :price, :total, :teacher_id)	
# 		end
# end


