RSpec.describe FinancialMath::CompoundInterest do
  before(:each) do
    @test_obj = Object.new
    @test_obj.extend(FinancialMath::CompoundInterest)
  end

  it 'is the correct result of the future value' do
    future_value = @test_obj.future_value(present_value: 1000,
                                          interest_rate: 0.12,
                                          periods: 3)
    expect(future_value).to eql(1404.93)
  end

  it 'is the correct future value for quarterly capitalization' do
    future_value = @test_obj.future_value(present_value: 1000,
                                          interest_rate: 0.36,
                                          periods: 3,
                                          frequency: 4)
    expect(future_value).to eql(2812.66)
  end

  it 'is the correct future value for monthly capitalization' do
    future_value = @test_obj.future_value(present_value: 1000,
                                          interest_rate: 0.36,
                                          periods: 3,
                                          frequency: 12)
    expect(future_value).to eql(2898.28)
  end

  it 'is the correct future value for daily capitalization' do
    future_value = @test_obj.future_value(present_value: 1000,
                                          interest_rate: 0.36,
                                          periods: 3,
                                          frequency: 360)
    expect(future_value).to eql(2943.09)
  end

  it 'is the correct value fo the effective rate equation' do
    effective_rate = @test_obj.effective_rate(nominal_rate: 0.215,
                                              frequency: 360 / 28.0)
    expect(effective_rate).to eql(0.2377)
  end

  it 'is th correct value of the nominal rate equation' do
    nominal_rate = @test_obj.nominal_rate(effective_rate: 0.2, frequency: 4)
    expect(nominal_rate).to eql(0.1865)
  end

  it 'is the correct value of the average_growth_rate' do
    average_growth_rate = @test_obj.average_growth_rate(present_value: 103.25,
                                                        future_value: 231.89,
                                                        periods: 3)
    expect(average_growth_rate).to eql 0.3096
  end

  it 'is the correct value of the continous_future_value' do
    continous_future_value = @test_obj.continous_future_value(present_value: 15,
                                                              interest_rate: 0.02,
                                                              periods: 365)
    expect(continous_future_value).to eql 22_204.50
  end

  it 'is the correct present value' do
    present_value = @test_obj.present_value(future_value: 1000,
                                            interest_rate: 0.1,
                                            periods: 1)
    expect(present_value).to eql 909.09
  end

  it 'is the correct present value for monthly capitalization' do
    present_value = @test_obj.present_value(future_value: 200_000,
                                            interest_rate: 0.36,
                                            periods: 3,
                                            frequency: 12)
    expect(present_value).to eql 69_006.49
  end

  it 'is the correct interest rate given the present value and future value' do
    rate_of_return = @test_obj.internal_rate_of_return(future_value: 200_000,
                                                       present_value: 100_000,
                                                       periods: 2)
    expect(rate_of_return).to eql 0.4142
  end

  it 'is the correct real rate of return given the interest rate and the inflation' do
    rate_of_return = @test_obj.real_rate_of_return(interest_rate: 0.4142,
                                                   inflation_rate: 0.45)
    expect(rate_of_return).to eql(- 0.0247)
  end

  it 'is the correct present value for continues capitalization' do
    present_value = @test_obj.continous_present_value(future_value: 1000,
                                                      interest_rate: 0.14,
                                                      periods: 3)
    expect(present_value).to eql 657.05
  end
end
