class Course
  attr_accessor :title, :schedule, :description

  def initialize
    @@all << self
  end

  class << self
    @@all =[]

    def all
      @@all
    end

    def reset_all
      all.clear
    end
  end
end
