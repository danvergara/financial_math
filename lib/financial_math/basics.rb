# frozen_string_literal :true

# Basic financial functions
module FinancialMath
  # A class that contains basic functions in finance
  class Basics
    def self.geometric_mean(growth_rates)
      raw_geometric_mean(growth_rates).round(4)
    end

    def self.continuous_capitalization(initial_value, rate, time)
      (initial_value * Math.exp(rate * time)).round(2)
    end

    def self.raw_geometric_mean(growth_rates)
      growth_rates.map { |i| i + 1 }.inject(:*)**(1.0 / growth_rates.size) - 1
    end

    private_class_method :raw_geometric_mean
  end
end
