class ApiController < ActionController::API
  include Response
  include ExceptionHandler
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_user!
  before_action :set_post, only: [:show_comments]

  def show_posts
    @posts = Post.all
    json_response(@posts)
  end

  def show_comments
    @comments = @post.comments
    json_response(@comments)
  end

  def add_comment
    @comment = Comment.create(post_id: params[:post_id], content: params[:content])
    @comment.user = current_user

    if @comment.save
      render json: 'Comment created successfully!'
    else
      render json: 'Comment not created!'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end