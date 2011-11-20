require 'spec_helper'

describe RegularExpressionsController do

  describe "GET 'show'"
  
  it "should be successful" do
    get :show
    response.should be_success
  end
  
  it "should have the right title" do
    get :show
    response.should have_selector("title", :content => "Regular Expression Tester")
  end
end
