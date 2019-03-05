module FinancialMath
  module CompoundInterest
    def present_value(future_value:, interest_rate:, frequency: 1.0, periods: 1)
      factor_val = factor(interest_rate: interest_rate,
                          frequency: frequency, periods: periods)
      (future_value / factor_val).round(2)
    end

    def future_value(present_value:, interest_rate:, frequency: 1.0, periods: 1)
      factor_val = factor(interest_rate: interest_rate,
                          frequency: frequency, periods: periods)
      (present_value * factor_val).round(2)
    end

    def effective_rate(nominal_rate:, frequency: 1)
      effective_rate = (1 + nominal_rate / frequency)**frequency - 1
      effective_rate.round(4)
    end

    def nominal_rate(effective_rate:, frequency: 1.0)
      root = nth_root(frequency: frequency)
      nominal_rate = ((1 + effective_rate)**root - 1) * frequency
      nominal_rate.round(4)
    end

    def period_of_capital_duplication(interest_rate:)
      (Math.log10(2) / Math.log10(1 + interest_rate)).round(2)
    end

    def average_growth_rate(future_value:, present_value:, periods: 1)
      ((future_value / present_value)**(1.0 / periods) - 1).round(4)
    end

    def continous_future_value(present_value:, interest_rate:, periods: 1)
      future_value = present_value * Math.exp(interest_rate * periods)
      future_value.round(2)
    end

    def continous_present_value(future_value:, interest_rate:, periods: 1)
      present_value = future_value / Math.exp(interest_rate * periods)
      present_value.round(2)
    end

    def real_rate_of_return(interest_rate:, inflation_rate:)
      ((interest_rate - inflation_rate) / (1 + inflation_rate)).round 4
    end

    def internal_rate_of_return(future_value:, present_value:, periods: 1)
      ((future_value / present_value)**(1.0 / periods) - 1).round(4)
    end

    private

    def factor(interest_rate:, frequency: 1.0, periods: 1)
      (1.0 + interest_rate / frequency)**(frequency * periods).to_f
    end

    def nth_root(frequency: 1)
      1.0 / frequency
    end
  end
end
