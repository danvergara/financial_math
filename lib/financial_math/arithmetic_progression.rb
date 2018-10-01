module FinancialMath
  class ArithmeticProgression
    attr_reader :distance, :times, :initial_value

    def initialize(args)
      @distance = args.fetch(:distance, 1)
      @times = args.fetch(:times, 1)
      @initial_value = args.fetch(:initial_value, 0)
    end

    def last_item
      (initial_value + (times - 1.0) * distance).round(2)
    end

    def sum
      (times / 2.0 * (initial_value + last_item)).round(2)
    end
  end
end
