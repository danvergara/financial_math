RSpec.describe FinancialMath::CompoundInterest do
  it 'is the correct result of the future value' do
    args = { present_value: 1000, interest_rate: 0.12, periods: 3 }
    compound_interest = FinancialMath::CompoundInterest.new(args)
    expect(compound_interest.future_value).to eql(1404.93)
  end

  it 'is the correct future value for quarterly capitalization' do
    args = { present_value: 1000, interest_rate: 0.36,
             periods: 3, frequency: 4 }
    compound_interest = FinancialMath::CompoundInterest.new(args)
    expect(compound_interest.future_value).to eql(2812.66)
  end

  it 'is the correct future value for monthly capitalization' do
    args = { present_value: 1000, interest_rate: 0.36,
             periods: 3, frequency: 12 }
    compound_interest = FinancialMath::CompoundInterest.new(args)
    expect(compound_interest.future_value).to eql(2898.28)
  end

  it 'is the correct future value for daily capitalization' do
    args = { present_value: 1000, interest_rate: 0.36,
             periods: 3, frequency: 360 }
    compound_interest = FinancialMath::CompoundInterest.new(args)
    expect(compound_interest.future_value).to eql(2943.09)
  end

  it 'is the correct value fo the effective rate equation' do
    args = { nominal_rate: 0.215, frequency: 360 / 28.0 }
    compound_interest = FinancialMath::CompoundInterest.new(args)
    expect(compound_interest.effective_rate).to eql(0.2377)
  end

  it ' is th correct value of the nominal rate equation' do
    args = { effective_rate: 0.2, frequency: 4 }
    compound_interest = FinancialMath::CompoundInterest.new(args)
    expect(compound_interest.nominal_rate).to eql(0.1865)
  end
end
