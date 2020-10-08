require_relative '../lib/marie'

describe "The program get data" do
  it "should return city name and email and must not be nil" do
    expect(get_townhall_url_scrapper).not_to be_nil
  end
  it "should be at least 50 cities" do
  expect(get_townhall_url_scrapper.length).to be > 49
  end
end

describe "The program get data" do
  it "verify that array contains some cities" do
  expect(get_townhall_url_scrapper.length).to match(hash_including("Argenteuil": "christain.bourney@ville-argenteuil.fr"))
  end

end 
