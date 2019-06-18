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
        context "FLC rates" do
          context "with invalid parameters" do
            it "should raise error" do
              expect{ Searates::API::LogisticsExplorer.get_fcl_rates(@lat_from, nil, @lat_to, @lng_to) }.to raise_error(Searates::Errors::API::MissingParameters)
            end
          end
          
          context "with valid parameters" do          
            it "should return fcl rates" do
              response = Searates::API::LogisticsExplorer.get_fcl_rates(@lat_from, @lng_from, @lat_to, @lng_to)
              expect(response['rates'].size).to be > 0
            end
          
            it "should return fcl rates with route info" do
              response = Searates::API::LogisticsExplorer.get_fcl_rates(@lat_from, @lng_from, @lat_to, @lng_to, true)
              expect(response['route'].size).to be > 0
            end
          end
        end
        
        context "LCL rates" do
          context "with valid parameters" do            
            it "should return lcl rates" do
              response = Searates::API::LogisticsExplorer.get_lcl_rates(@lat_from, @lng_from, @lat_to, @lng_to, @weight, @volume)
              expect(response['rates']['lcl'].size).to be > 0
            end
          end
          
          context "with invalid parameters" do          
            it "should raise error" do
              expect{ Searates::API::LogisticsExplorer.get_lcl_rates(@lat_from, @lng_from, @lat_to, nil, @weight, @volume) }.to raise_error(Searates::Errors::API::MissingParameters)
            end
          end
        end
        
        context "Sea route" do
          context "with valid parameters" do 
            it "should return sea route" do
              response = Searates::API::LogisticsExplorer.get_sea_route(@lat_from, @lng_from, @lat_to, @lng_to)
              expect(response['route'].size).to be > 1
            end
          end
          
          context "with invalid parameters" do
            it "should raise error" do
              expect{ Searates::API::LogisticsExplorer.get_sea_route(nil, @lng_from, @lat_to, @lng_to) }.to raise_error(Searates::Errors::API::MissingParameters)
            end
          end
        end
        
        context "Air rates" do
          context "with valid parameters" do
            it "should return air rates" do
              response = Searates::API::LogisticsExplorer.get_air_rates(@lat_from, @lng_from, @lat_to, @lng_to, @weight)
              expect(response['rates']['air'].size).to be > 0
            end
          end
          
          context "with invalid parameters" do            
            it "should raise error" do
              expect{ Searates::API::LogisticsExplorer.get_air_rates(@lat_from, @lng_from, @lat_to, nil, @weight) }.to raise_error(Searates::Errors::API::MissingParameters)
            end
          end
        end
        
        context "Rail rates" do
          context "with valid parameters" do
            it "should return rail rates" do
              response = Searates::API::LogisticsExplorer.get_rail_rates(@lat_from, @lng_from, @lat_to, @lng_to)
              expect(response['rates'].size).to be > 0
            end
          end
          
          context "with invalid parameters" do            
            it "should raise error" do
              expect{ Searates::API::LogisticsExplorer.get_rail_rates(@lat_from, @lng_from, nil, @lng_to) }.to raise_error(Searates::Errors::API::MissingParameters)
            end
          end
        end
        
        context "Road rates" do
          context "with valid parameters" do
            context "without optional parameters" do
              it "should return road rates" do
                response = Searates::API::LogisticsExplorer.get_road_rates(@lat_from, @lng_from, @lat_to, @lng_to, @weight, @volume)
                expect(response['rates'].size).to be > 0
              end
            end
            
            context "determining the type" do
              it "should return road rates" do
                response = Searates::API::LogisticsExplorer.get_road_rates(@lat_from, @lng_from, @lat_to, @lng_to, @weight, @volume, 'FCL')
                expect(response['rates'].size).to be > 0
              end
            end
            
            context "determining the size of container" do
              it "should return road rates" do
                response = Searates::API::LogisticsExplorer.get_road_rates(@lat_from, @lng_from, @lat_to, @lng_to, @weight, @volume, 'CONTAINER', '40st')
                expect(response['rates'].size).to be > 0
              end
            end
          end
          
          context "with invalid parameters" do
            it "should raise error" do
              expect{ Searates::API::LogisticsExplorer.get_road_rates(@lat_from, @lng_from, @lat_to, @lng_to, @weight, nil) }.to raise_error(Searates::Errors::API::MissingParameters)
            end
            
            context "with invalid type" do         
              it "should raise error" do
                expect{ Searates::API::LogisticsExplorer.get_road_rates(@lat_from, @lng_from, @lat_to, @lng_to, @weight, @volume, 'ABC', '40ref') }.to raise_error(Searates::Errors::API::InvalidParameterValue)
              end
            end
            
            context "with invalid size" do         
              it "should raise error" do
                expect{ Searates::API::LogisticsExplorer.get_road_rates(@lat_from, @lng_from, @lat_to, @lng_to, @weight, @volume, 'FCL', '40') }.to raise_error(Searates::Errors::API::InvalidParameterValue)
              end
            end
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
