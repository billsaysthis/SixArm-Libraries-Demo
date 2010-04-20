require 'spec_helper'

describe CompaniesController do
  describe "GET 'terminated_staff'" do
    it "should be successful" do
      company = Company.make
      get 'terminated_staff', :id => company
      response.should be_success ##
    end
  end

  describe "GET 'import_staff'" do
    it "should be successful" do
      company = Company.make
      get 'import_staff', :id => company
      response.should be_success ##
    end
  end

  describe "GET 'export_staff'" do
    it "should be successful" do
      company = Company.make
      get 'export_staff', :id => company
      response.should be_success ##
    end
  end

end
