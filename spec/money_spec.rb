require_relative '../dollar'

describe 'MoneyText' do
  it 'testMultiplication' do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eq 10

    product = five.times(3)
    expect(product.amount).to eq 15
  end
end
