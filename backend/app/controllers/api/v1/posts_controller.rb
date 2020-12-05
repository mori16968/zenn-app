module Api
  module V1
    class PostsController < ApplicationController
      def index
        # この辺りはかなり簡略化しています。
	# 本来であれば seeds.rb を作成した方が良いです...
        if Post.count.zero?
          ['1st post', '2nd post', '3rd post'].each do |title|
            Post.create!(title: title)
          end
        end
	# この辺りも本来であればきちんとシリアライズした方が良いです...
        render json: { posts: Post.all.to_json }
      end
    end
  end
end