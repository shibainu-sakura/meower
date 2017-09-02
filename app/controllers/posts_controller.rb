class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :toggle_follow] #add toggle follow
  # 4  user variable is equal to current account #
  before_action :set_current_user, only: [:create]
  # 4 #

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show #77
    # @follow_status = user.follows?(celebrity)  #77
    # @follow_status = current_user.follows?(@post.user) #ture or false #77
    @follow_status = current_user.follows?(@post.user) ? 'Unfollow' : 'Follow' #77
  end

  # toggle 22 & add toggle_follow to before action set_action
  def toggle_follow
   #user.toggle_follow!(celebrity) process 22, comment out this one
   #current_user.toggle_follow!(:user_id) process 44, comment out this one
   current_user.toggle_follow!(@post.user) #to get user object of the poster who post something 4
   redirect_to :back  #66
  end

  # GET /posts/new
  def new
    @post = Post.new
  end  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
  # 4 #
    @post.user_id = @user.id
  # #
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  # 4 #
    def set_current_user
      @user = current_user
    end
  #  #
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :user_id)
    end
end
