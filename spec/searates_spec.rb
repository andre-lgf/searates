RSpec.describe Searates do
  it "has a version number" do
    expect(Searates::VERSION).not_to be nil
  end
  
  describe Searates::Configuration do
    context "with valid api key" do
      it "should return the api key" do
        expect(Searates.configuration.api_key).to eq(ENV['SEARATES_API_KEY'])
      end
      
      context "logistics explorer API" do
        context "with valid coordinates" do
          before(:each) do
            @lat_from = -30.0346
            @lng_from = -51.2176
            @lat_to = 31.23054
            @lng_to = 121.4737
          end
          
          it "should return fcl rates" do
            response = Searates::API::LogisticsExplorer.get_fcl_rates(@lat_from, @lng_from, @lat_to, @lng_to)
            expect(response['rates'].length).to be > 0
          end
          
          it "should return fcl rates with route info" do
            response = Searates::API::LogisticsExplorer.get_fcl_rates(@lat_from, @lng_from, @lat_to, @lng_to, true)
            expect(response['route'].size).to be > 0
          end
        end
      end
    end
    
    context "without valid api key" do
      before do
        Searates.reset
      end
      it "should return an error" do
        expect { Searates.configuration.api_key }.to raise_error(Searates::Errors::Configuration)
      end
    end
  end
end
