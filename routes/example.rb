# encoding: utf-8
require 'json'

class MyApp < Sinatra::Application
	# 간단 라우트 예제
	get "/" do
		@title = "Hello world"
		erb :example
	end
	# 간단 라우트 예제 -1 
	get "/example" do
		@title = "Example Test"
		erb :example
	end

	# 라우트 값 가져오기 
	# GET /example/1/news
	get "/example/1/:path" do
		"Hello #{params[:path]}"
	end

	# 라우트 값 가져오기 - 3
	# GET /example/news/it
	get "/example/2/*/*" do
		"Hello #{params[:splat][0]} : #{params[:splat][1]}"
	end

	# 라우트 값 가져오기 - 4
	# GET /example/3/news/it
	get "/example/3/*/*" do | path, category |
		"Hello #{path} : #{category}"
	end

	# simple erb
	get "/example/erb/1" do
		@name = "yundream"
		erb :erbexample01
	end

	# simple erb 2
	get "/example/erb/*/to/*" do  | @path, @file |
		time = Time.new
		@updatetime = time.strftime("%Y-%m-%d %H:%M:%S")
		erb :erbexample02
	end

	# json sample
	# sudo gem install json
	# require 'json'
	get "/example/erb/json" do 
		content_type :json
		{:name=>'yundream', :address=>'Korea seoul', :company=>'KTCloudware'}.to_json 
	end

	# HTTP Error code handling
	get "/example/error" do 
		content_type :json
		response.status=453
		{:result=>'453', :msg=>'unknown error'}.to_json 
	end
######################################################
end
