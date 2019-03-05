RSpec.describe FinancialMath::SimpleInterest do
  before(:each) do
    @test_obj = Object.new
    @test_obj.extend(FinancialMath::SimpleInterest)
  end

  it 'is the correct result of the future value' do
    future_value = @test_obj.future_value(present_value: 100_000.0,
                                          interest_rate: 0.05,
                                          periods: 3)
    expect(future_value).to eql(115_000.0)
  end

  it 'is the correct future value in days' do
    future_value = @test_obj.future_value(present_value: 1500.0,
                                          interest_rate: 0.45,
                                          periods: 73, frequency: 360)
    expect(future_value).to eql(1636.88)
  end

  it 'is the correct present value' do
    present_value = @test_obj.present_value(future_value: 3000.0,
                                            interest_rate: 0.5,
                                            periods: 1.5)
    expect(present_value).to eql(1_714.29)
  end

  it 'is the correct present value in days' do
    present_value = @test_obj.present_value(future_value: 100_000.0,
                                            interest_rate: 0.415,
                                            periods: 55,
                                            frequency: 360)
    expect(present_value).to eql(94_037.75)
  end

  it 'is the correct interest rate given the discount rate' do
    interest_rate = @test_obj.interest_rate(discount_rate: 0.36,
                                            periods: 200,
                                            frequency: 360)
    expect(interest_rate).to eql(0.45)
  end

  it 'is the correct discount rate given the interest rate' do
    discount_rate = @test_obj.discount_rate(interest_rate: 0.45,
                                            periods: 200,
                                            frequency: 360)
    expect(discount_rate).to eql(0.36)
  end
end
