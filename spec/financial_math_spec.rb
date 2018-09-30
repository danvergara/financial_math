require 'financial_math'
require 'financial_math/basics'

RSpec.describe FinancialMath do
  it 'has a version number' do
    expect(FinancialMath::VERSION).not_to be nil
  end
end

RSpec.describe FinancialMath::Basics do
  it 'correct geometric mean result' do
    growth_rates = [0.01, 0.24, 0.03, 0.10, 0.02]
    expect(FinancialMath::Basics.geometric_mean(growth_rates)).to be_an(Float)
  end

  it 'correct continuously compounded interest' do
    expect(FinancialMath::Basics.continuous_capitalization(50_000, 0.1, 6)).to be_an(Float)
  end
end
