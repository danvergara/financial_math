RSpec.describe FinancialMath::GeometricProgression do
  it 'is the last time of the geometric progression' do
    progression = FinancialMath::GeometricProgression.new(initial_value: 1100,
                                                          ratio: 1.1, times: 5)
    expect(progression.last_item).to eql(1610.51)
  end

  it ' is the sum of the growing geometric progression' do
    progression = FinancialMath::GeometricProgression.new(initial_value: 1000,
                                                          ratio: 1.02,
                                                          times: 12)
    expect(progression.sum).to eql(13_412.09)
  end

  it ' is the sum of the decreasing geometric progression' do
    progression = FinancialMath::GeometricProgression.new(initial_value: 1000,
                                                          ratio: 0.8,
                                                          times: 12)
    expect(progression.sum).to eql(4656.4)
  end

  it 'raises an ZeroDivisionError' do
    progression = FinancialMath::GeometricProgression.new(initial_value: 1000,
                                                          ratio: 1, times: 12)
    expect { progression.sum }.to raise_error(ZeroDivisionError, "ratio can't be equal to one")
  end
end
