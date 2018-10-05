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
