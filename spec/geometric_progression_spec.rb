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
