require 'test_challenge'

describe 'printing name' do
  it 'should print out name' do
    expect { print_name }.to output("name").to_stdout
  end
end
