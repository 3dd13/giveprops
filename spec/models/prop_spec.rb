require 'spec_helper'

describe Prop do
	describe "#all_professions_by_user_id" do
    before(:each) do
    	@prop = Prop.create(user_id: 1, profession_id: 1, rating: 4)
    end

    it "should return list of props" do
      result = Prop.all_professions_by_user_id(1)
    	result[0].total.should eq 4
    end
	end
end