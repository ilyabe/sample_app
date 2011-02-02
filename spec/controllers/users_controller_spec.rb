require 'spec_helper'

describe UsersController do
	render_views
	
	before(:each) do
		@user = Factory(:user)
	end
		
	describe "GET 'show'" do

		it "should be successful" do
			get :show, :id =>@user
			response.should be_success
		end
		
		it "should find the right user" do
			get :show, :id => @user
			assigns(:user).should == @user
		end
	end

	describe "GET 'new'" do
	
		it "should be successful" do
			get :new
			response.should be_success
		end
	
		it "should have the right title" do
			get :new
			response.should have_selector("title", :content => "Sign up")
		end
		
		it "should have the right title" do
			get :show, :id => @user
			response.should have_selector("title", :content => @user.name)
		end
		
		it "should include the user's name" do
			get :show, :id => @user
			response.should have_selector("h1", :content => @user.name)
		end
		
		it "should have a profile image" do
			get :show, :id => @user
			response.should have_selector("h1>img", :class => "gravatar")
		end
	end
	
	describe "POST 'create'" do
		
		describe "failure" do
			
			before(:each) do
				@attr = { :name => "", :email => "", :password => "",
												:password_confirmation => "" }
			end
													
			it "should not create a user" do
				lambda do
					post :create, :user => @attr
				end.should_not change(User, :count)
			end

			it "should have the right title" do
				post :create, :user => @attr
				response.should have_selector("title", :content => "Sign up")
			end
			
			it "should render the 'new' page" do
				post :create, :user => @attr
				response.should render_template('new')
			end
		end
	end
end