module FinancialMath
  class CompoundInterest
    def initialize(args)
      @present_value = args.fetch(:present_value, 0.0)
      @periods = args.fetch(:periods, 1.0)
      # frequency of conversions
      @frequency = args.fetch(:frequency, 1.0)
      @interest_rate = args.fetch(:interest_rate, 0.0)
      @nominal_rate = args.fetch(:nominal_rate, 0.0)
      @effective_rate = args.fetch(:effective_rate, 0.0)
      @future_value = args.fetch(:future_value, 0.0)
    end

    def average_growth_rate
      ((@future_value / @present_value)**(1.0 / @periods) - 1).round(4)
    end

    def continous_future_value
      @future_value = @present_value * Math.exp(@interest_rate * @periods)
      @future_value.round(2)
    end

    def effective_rate
      @effective_rate = (1 + @nominal_rate / @frequency)**@frequency - 1
      @effective_rate.round(4)
    end

    def future_value
      (@present_value * factor).round(2)
    end

    def interest
      @present_value * (factor - 1)
    end

    def nominal_rate
      @nominal_rate = ((1 + @effective_rate)**nth_rooth - 1) * @frequency
      @nominal_rate.round(4)
    end

    private

    def factor
      (1.0 + @interest_rate / @frequency)**(@frequency * @periods)
    end

    def nth_rooth
      1.0 / @frequency
    end
  end
end
