RSpec.shared_examples 'sends request to google books api correctly'  do
  it do
    expect_any_instance_of(described_class).to receive(http_method).with(*request_params)

    subject
  end
end
