require_relative '../lib/challenge_2.rb'

describe 'printing name' do
  it 'should print out name' do
    expect { print_name }.to output("Challenge 2").to_stdout
  end
end
