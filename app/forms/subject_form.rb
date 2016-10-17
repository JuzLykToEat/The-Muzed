class SubjectForm
  include ActiveModel::Model

  def initialize(subject)
    @date = nil
    @time = nil
    @level = subject.level
    @hourly_rate = subject.hourly_rate
    @title = subject.title
  end
  
  attr_accessor :title, :time, :level, :hourly_rate, :date
end
