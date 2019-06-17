RSpec.describe Searates do
  it "has a version number" do
    expect(Searates::VERSION).not_to be nil
  end
  
  describe Searates::Configuration do
    context "without valid api key" do
      it "should return an error" do
        expect (Searates.configuration.api_key).to_eq(Searates::Errors::Configuration)
      end
    end
  end
end
