require 'challenge_2'

describe 'printing name' do
  it 'should print out name' do
    expect { print_name }.to output("Challenge 2").to_stdout
  end
end
