require 'financial_math'

RSpec.describe FinancialMath do
  it 'has a version number' do
    expect(FinancialMath::VERSION).not_to be nil
  end

  it 'is the correct geometric mean result' do
    growth_rates = [0.01, 0.24, 0.03, 0.10, 0.02]
    expect(FinancialMath.geometric_mean(growth_rates)).to be_an(Float)
  end

  it 'is the correct continuously compounded interest' do
    expect(FinancialMath.continuous_capitalization(50_000, 0.1, 6)).to be_an(Float)
  end
end

RSpec.describe FinancialMath::GeometricProgression do
  it 'is the last time of the geometric progression' do
    args = { initial_value: 1100, ratio: 1.1, times: 5 }
    geometric_progression = FinancialMath::GeometricProgression.new(args)
    expect(geometric_progression.last_item).to eql(1610.51)
  end

  it ' is the sum of the growing geometric progression' do
    args = { initial_value: 1000, ratio: 1.02, times: 12 }
    geometric_progression = FinancialMath::GeometricProgression.new(args)
    expect(geometric_progression.sum).to eql(13_412.09)
  end

  it ' is the sum of the decreasing geometric progression' do
    args = { initial_value: 1000, ratio: 0.8, times: 12 }
    geometric_progression = FinancialMath::GeometricProgression.new(args)
    expect(geometric_progression.sum).to eql(4656.4)
  end

  it 'raises an ZeroDivisionError' do
    args = { initial_value: 1000, ratio: 1, times: 12 }
    geometric_progression = FinancialMath::GeometricProgression.new(args)
    expect { geometric_progression.sum }.to raise_error(ZeroDivisionError, "ratio can't be equal to one")
  end
end

RSpec.describe FinancialMath::ArithmeticProgression do
  it 'is the last time of the arithmetic progression' do
    args = { initial_value: 80_000, distance: 2000, times: 12 }
    geometric_progression = FinancialMath::ArithmeticProgression.new(args)
    expect(geometric_progression.last_item).to eql(102_000.00)
  end

  it 'is the sum of the arithmetic progression' do
    args = { initial_value: 100, distance: 7, times: 20 }
    geometric_progression = FinancialMath::ArithmeticProgression.new(args)
    expect(geometric_progression.sum).to eql(3330.00)
  end
end

RSpec.describe FinancialMath::SimpleInterest do
  it 'is the correct result of the future value' do
    args = { present_value: 100_000.0, interest_rate: 0.05, periods: 3 }
    simple_interest = FinancialMath::SimpleInterest.new(args)
    expect(simple_interest.future_value).to eql(115_000.0)
  end

  it 'is the correct future value in days' do
    args = { present_value: 1500.0, interest_rate: 0.45, periods: 73 }
    simple_interest = FinancialMath::SimpleInterest.new(args)
    expect(simple_interest.future_value_in_days).to eql(1636.88)
  end

  it 'is the correct present value' do
    args = { future_value: 3000.0, interest_rate: 0.5, periods: 1.5 }
    simple_interest = FinancialMath::SimpleInterest.new(args)
    expect(simple_interest.present_value).to eql(1_714.29)
  end

  it 'is the correct present value in days' do
    args = { future_value: 100_000.0, interest_rate: 0.415, periods: 55 }
    simple_interest = FinancialMath::SimpleInterest.new(args)
    expect(simple_interest.present_value_in_days).to eql(94_037.75)
  end

  it 'is the correct interest rate given the discount rate' do
    args = { bank_discount_rate: 0.36, periods: 200 }
    simple_interest = FinancialMath::SimpleInterest.new(args)
    expect(simple_interest.interest_rate_given_discount_rate).to eql(0.45)
  end

  it 'is the correct discount rate given the interest rate' do
    args = { interest_rate: 0.45, periods: 200 }
    simple_interest = FinancialMath::SimpleInterest.new(args)
    expect(simple_interest.discount_rate_given_interest_rate).to eql(0.36)
  end
end
