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
