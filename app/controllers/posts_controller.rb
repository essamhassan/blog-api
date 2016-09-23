class PostsController < ApplicationController
  def create
  	@post = Post.new(post_params)
  	if @post.valid?
  	    @post.save
  	    render :json => { :id => @post.id }
  	else
  		render :json => { :error => "post not saved"}, status: :bad_request
  	end
  end

  def show
  	@post = Post.find(params[:id])
  	if @post
  		render :json => @post.as_json( :include => :user )
  	else
  		render :json => { :error => "post not found" }, status: :not_found
  	end
  end

  def like
  	@post = Post.find(params[:post_id])
  	@user = User.find(params[:user_id])
  	@isliked=@user.liked? @post
  	if @post && @user
  		if @isliked
  		    @post.unliked_by @user
  		else
  			@post.liked_by @user
  		end
  		render :json => {:id => @post.id , :isliked=> @isliked }
  	else
  		render :json => { :error => "post/user not found" }, status: :not_found
  	end
  end

  private

  def post_params
    params.permit(:content,:title,:id)
  end
end
