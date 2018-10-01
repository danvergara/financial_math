module FinancialMath
  class GeometricProgression
    attr_reader :initial_value, :ratio, :times

    def initialize(args)
      @initial_value = args.fetch(:initial_value, 1)
      @ratio = args.fetch(:ratio, 0)
      @times = args.fetch(:times, 1)
    end

    def last_item
      (initial_value * ratio**(times - 1)).round(2)
    end

    def sum
      if ratio > 1
        growing_progression
      elsif ratio < 1
        decreasing_progression
      elsif ratio == 1
        raise ZeroDivisionError, "ratio can't be equal to one"
      end
    end

    private

    def growing_progression
      (initial_value * (ratio**times - 1.0) / (ratio - 1.0)).round(2)
    end

    def decreasing_progression
      (initial_value * (1.0 - ratio**times) / (1.0 - ratio)).round(2)
    end
  end
end
