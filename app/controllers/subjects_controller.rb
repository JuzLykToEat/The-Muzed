class SubjectsController < ApplicationController
  before_action :authenticate_teacher!

  def new
    @subject = SubjectForm.new(Subject.new)
    @teacher = Teacher.find(params[:teacher_id])
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @subject = @teacher.subjects.create(subject_params.merge(teacher_id: @teacher.id))
    @schedule = @subject.schedules.create(schedule_params.merge(subject_id: @subject.id))
    @timeslot = @schedule.timeslots.create(timeslot_params.merge(schedule_id: @schedule.id, teacher_id: @teacher.id))

    if @subject.persisted? && @schedule.persisted? && @timeslot.persisted?
      redirect_to teacher_path(@teacher.id)
    end
  end

  private

    def subject_params
      params.require(:subject_form).permit(:title, :level, :hourly_rate)
    end

    def schedule_params
      params.require(:subject_form).permit(:date)
    end

    def timeslot_params
      params.require(:subject_form).permit(:time)
    end
end
