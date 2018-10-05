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
