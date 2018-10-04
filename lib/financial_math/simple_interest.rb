module FinancialMath
  class SimpleInterest
    attr_reader :periods

    def initialize(args)
      @present_value = args.fetch(:present_value, 0)
      @periods = args.fetch(:periods, 0)
      @interest_rate = args.fetch(:interest_rate, 0)
      @future_value = args.fetch(:future_value, 0)
      @bank_discount_rate = args.fetch(:bank_discount_rate, 0)
    end

    def bank_discount_rate
      @bank_discount_rate = (discount / future_value).round(2)
    end

    def discount
      (@future_value - @present_value).round(2)
    end

    def future_value
      @future_value = (@present_value * (1 + periods * @interest_rate)).round(2)
    end

    def future_value_in_days
      @future_value = @present_value * (1 + @interest_rate * periods_in_days)
      @future_value.round(2)
    end

    def present_value
      @present_value = (@future_value / (1 + periods * @interest_rate)).round(2)
    end

    def present_value_in_days
      @present_value = @future_value / (1 + @interest_rate * periods_in_days)
      @present_value.round(2)
    end

    def rational_discount_in_days
      (@present_value * @interest_rate * @periods_in_days).round(2)
    end

    def bank_discount_in_days
      (@future_value * @bank_discount_rate * @periods_in_days).round(2)
    end

    def interest_rate_given_discount_rate
      divisor = 1 - @bank_discount_rate * periods_in_days
      @interest_rate = (@bank_discount_rate / divisor).round(2)
    end

    def discount_rate_given_interest_rate
      divisor = 1 + @interest_rate * periods_in_days
      @bank_discount_rate = (@interest_rate / divisor).round(2)
    end

    private

    def periods_in_days
      periods / 360.0
    end
  end
end
