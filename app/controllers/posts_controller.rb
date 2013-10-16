class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  		flash[:success] = "Post saved!"
  		redirect_to root_url
  	else
      @feed_items = [ ]
  		render 'static_pages/home'
  	end
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  private

  	def post_params
  		params.require(:post).permit(:content, :title)
  	end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url of @post.nil?
    end
end