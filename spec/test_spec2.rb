require 'test_challenge2'

describe 'print not name' do
  it 'should print out not name' do
    expect { print_name2 }.to output("test").to_stdout
  end
end
