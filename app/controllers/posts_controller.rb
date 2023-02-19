class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @tags = Post.tag_counts_on(:tags).most_used(20)    # タグ一覧表示
  end
  
  def show
    @post = Post.find(params[:id])
    @tags = @post.tag_counts_on(:tags)    # 投稿に紐付くタグの表示
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :tag_list)
  end

end
