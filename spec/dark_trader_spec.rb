require_relative '../lib/dark_trader'

describe "A hash should be returned" do
    it "should return a hash" do
        expect(create_crypto_hash.class).to eq(Hash)
    end
  end

describe "return first element of symbol_list" do
    it "should return an element" do
        expect(create_crypto_hash.keys[0]).to eq("BTC")
    end
end

