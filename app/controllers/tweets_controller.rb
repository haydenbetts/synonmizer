class TweetsController < ApplicationController
    get "/tweets" do
        erb :"tweets/index"
    end

    get "/tweets/:id" do
        @tweet = Tweet.find(params[:id])
        erb :"tweets/show"
    end
end