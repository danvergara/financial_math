module FinancialMath
  module SimpleInterest
    def future_value(present_value:, interest_rate:, periods: 0, frequency: 1)
      factor_val = factor(periods: periods, frequency: frequency)
      (present_value * (1 + interest_rate * factor_val)).round(2)
    end

    def present_value(future_value:, interest_rate:, periods: 0, frequency: 1)
      factor_val = factor(periods: periods, frequency: frequency)
      (future_value / (1 + interest_rate * factor_val)).round(2)
    end

    def interest_rate(discount_rate:, periods: 0, frequency: 1)
      divisor = 1 - discount_rate * factor(periods: periods,
                                           frequency: frequency)
      (discount_rate / divisor).round(2)
    end

    def discount_rate(interest_rate:, periods: 0, frequency: 1)
      divisor = 1 + interest_rate * factor(periods: periods,
                                           frequency: frequency)
      (interest_rate / divisor).round(2)
    end

    def rational_discount(present_value:, interest_rate:,
                          periods: 0, frequency: 1)
      factor_val = factor(periods: periods, frequency: frequency)
      (present_value * interest_rate * factor_val).round(2)
    end

    def bank_discount(future_value:, discount_rate:, periods: 0, frequency: 1)
      factor_val = factor(periods: periods, frequency: frequency)
      (future_value * discount_rate * factor_val).round(2)
    end

    private

    def factor(periods: 0, frequency: 1)
      periods / frequency.to_f
    end
  end
end
