require 'spec_helper'
require 'httparty'

describe TMDBParty::Movie do
  before(:each) do
    stub_get('/Movie.getInfo/en/json/key/1858', 'transformers.json')
  end
  
  let :transformers do
    HTTParty::Parser.call(fixture_file('transformers.json'), :json).first
  end
  
  let :transformers_movie do
    TMDBParty::Movie.new(transformers, TMDBParty::Base.new('key'))
  end
  
  it "should take an attributes hash and a TMDBParty::Base instance when initialized" do
    expect { TMDBParty::Movie.new({}, TMDBParty::Base.new('key')) }.to_not raise_error
  end
  
  describe "attributes" do
    [:posters, :backdrops, :homepage, :trailer, :runtime, :genres, :cast].each do |attribute|
      it "should load #{attribute} attribute by looking up the movie" do
        movie = TMDBParty::Movie.new({ 'id' => 1858 }, TMDBParty::Base.new('key'))
        movie.send(attribute).should_not be_nil
      end
    
      # TODO
      # it "should not look up the movie when #{attribute} is not missing" do
      #   tmdb = mock(TMDBParty::Base)
      #   movie = TMDBParty::Movie.new({ 'id' => 1858, attribute.to_s => transformers[attribute.to_s] }, tmdb)
      #   
      #   tmdb.should_not_receive(:get_info)
      #   movie.send(attribute)
      # end
    end
    
    it "should have a release date" do
      transformers_movie.released.should == Date.new(2007, 7, 4)
    end
    
    it "should have a list of directors" do
      transformers_movie.directors.map { |p| p.name }.should == ['Michael Bay']
    end
    
    it "should have a list of actors" do
      transformers_movie.should have(17).actors
    end
    
    it "should have a list of writers" do
      transformers_movie.writers.should == []
    end
    
    it "should have a list of poster hashes" do
      transformers_movie.should have(10).posters
      poster = transformers_movie.posters.first
      poster.keys.should include('cover', 'thumb', 'mid', 'original')
    end
    
    it "should have a list of backdrop hashes" do
      transformers_movie.should have(11).backdrops
      backdrop = transformers_movie.backdrops.first
      backdrop.keys.should include('thumb', 'poster', 'original')
    end
    
    it "should have a list of genres" do
      transformers_movie.should have(3).genres
      transformers_movie.genres.map { |g| g.name }.should include('Action', 'Adventure', 'Science Fiction')
    end
  end
  
end