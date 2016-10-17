class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		teacher = @photo.teacher

		@photo.destroy
		@photos = Photo.where(teacher_id: teacher.id)

		respond_to :js
	end

end