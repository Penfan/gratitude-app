require 'rails_helper'

feature 'Visitors page' do

  setup do
    @user = User.create(:name => "Test", :email => "test@test.com", :password => "123421342134", :ministry => %W(Koinonia A2F Klesis ThirdSpace).shuffle[0], :year => rand(1980..2020))
    sign_in @user
  end

  # test "should get index" do
    # get :index
    # response.should be_success
  # end

  scenario "should create thanks" do
    @thank = Thank.new(:text => "FOOD AND STUFF")
    @thank.should be_an_instance_of Thank
  end

  scenario "should destroy thanks" do
    @thank = Thank.new(:text => "FOOD AND STUFF")
    @thank.save!
    expect{@thank.destroy}.to change{Thank.count}.by(-1)
  end

  scenario "should destroy user" do
    @user = User.new(:email => "blba@blba.com", :password => "123412341234", :year => "2016")
    @user.save!
    expect{@user.destroy}.to change{User.count}.by(-1)
  end

  scenario "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  

end