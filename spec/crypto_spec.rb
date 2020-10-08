require_relative '../lib/crypto'

describe "The program get data" do
  it "should return crypto's symbole and crypto value. crypto is not nil" do
    expect(crypto_scrapper).not_to be_nil
  end
end
