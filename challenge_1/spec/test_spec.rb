require_relative "../lib/test_challenge.rb"
describe 'printing name' do
  it 'should print out name' do
    expect { print_name }.to output("name").to_stdout
  end
end
