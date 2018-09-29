describe user('hab') do
  it { should_not exist }
end

describe group('hab') do
  it { should_not exist }
end

describe directory('/home/hab') do
  it { should_not exist }
end
