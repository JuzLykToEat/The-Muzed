class SchedulesController < ApplicationController
  def index
    @subject = Subject.find(params[:subject_id])
    @schedules = @subject.schedules.order(created_at: :desc)
  end

end
