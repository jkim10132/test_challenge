require 'test_challenge'
require 'test_challenge2'
describe 'printing name' do
  it 'should print out name' do
    expect { print_name }.to output("name").to_stdout
  end

  it 'should print out test' do
    expect { print_name2 }.to output("name").to_stdout
  end
end
