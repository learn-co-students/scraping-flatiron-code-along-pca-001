class Course
  attr_accessor :title, :schedule, :description
  @all = []
  def initialize
    self.class.all << self
  end

  class << self
    attr_reader :all

    def reset_all
      @all.clear
    end
  end
end
