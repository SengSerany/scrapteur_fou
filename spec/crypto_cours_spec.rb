require_relative "../lib/crypto_cours.rb"

describe "trader method" do
    it "hash_crypto" do
      expect(extract_crypto_monney_name).to be_instance_of Hash
    end
end