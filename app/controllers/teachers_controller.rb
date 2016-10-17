class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update]
  before_action :authenticate_teacher!, except: [:show, :index]

  def index
    params[:subjects] ||= ["Piano", "Violin", "Vocal"]
    params[:levels] ||= ["Beginner", "Intermediate", "Advanced", "Diploma"]
    if params[:search]
      @teachers = Teacher.search("*", where: {
        location: { near: Geocoder.coordinates(params[:search][:search_place]), within: '20mi' },
        subjects: params[:subjects],
        levels: params[:levels]
      })
    else
      @teachers = Teacher.all
    end
  end

  def show
    @teachers = Teacher.all
    @photos = @teacher.photos
  end

  def edit
    if current_user.id == @teacher.user.id
    @photos = @teacher.photos
    else
      redirect_to root_path, notice: "You don't have permission"
    end
  end

  def update
    if @teacher.update(teacher_params)

      if params[:images]
        params[:images].each do |image|
          @teacher.photos.create(image: image)
        end
      end

      redirect_to edit_teacher_path(@teacher), notice: "Your teacher's profile is updated!"
    else
      render :edit
    end
  end

  private
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit(:subject, :education, :biography, :teaching_statement, :address, :ages_taught, :levels_taught, :languages, :lesson_locations, :hourly_rate, :teach_special_needs, :active)
    end

end
