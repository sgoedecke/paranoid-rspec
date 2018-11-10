describe 'paranoid rspec' do
  it 'failing tests should fail' do
    expect(true).to eq(false)
  end

  it 'tests with no expectations should fail' do
  end

  it 'tests which do not run their expectations should fail' do
    expect(true).to eq(false) if false
  end
end
