require 'financial_math'

RSpec.describe FinancialMath do
  it 'has a version number' do
    expect(FinancialMath::VERSION).not_to be nil
  end

  it 'correct geometric mean result' do
    growth_rates = [0.01, 0.24, 0.03, 0.10, 0.02]
    expect(FinancialMath.geometric_mean(growth_rates)).to be_an(Float)
  end

  it 'correct continuously compounded interest' do
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
