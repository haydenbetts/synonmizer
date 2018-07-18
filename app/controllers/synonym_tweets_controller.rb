class SynonymTweetsController < ApplicationController

    get "/tweets/:id/synonym_tweets/new" do
        @tweet = Tweet.find(params[:id])
        @words = SynonymTweet.random_words_from_text(@tweet.text, num)
        # pass three random words and their senses in

        erb :"synonym_tweets/new"
    end


end