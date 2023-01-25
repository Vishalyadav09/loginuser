class BlogsController < ApplicationController
    

def index
  @user = User.find(params[:user_id])
  @blogs=@user.blogs
end
def edit
  @user = User.find(params[:user_id])
  @blog=@user.blogs.find(params[:id])
end
def new
  @user = User.find(params[:user_id])
  @blog=Blog.new
end 
def show
  @user = User.find(params[:user_id])
  @blog=@user.blogs.find(params[:id])
end
# POST /blogs or /blogs.json
def create
  @user = User.find(params[:user_id])
  @blog = @user.blogs.new(blog_params)

  respond_to do |format|
    if @blog.save
      format.html { redirect_to user_blogs_path(@user)}
      format.json { render :show, status: :created, location: @blog }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @blog.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /blogs/1 or /blogs/1.json
def update
  @user = User.find(params[:user_id])
  @blog= Blog.find(params[:id])
  respond_to do |format|
    if @blog.update(blog_params)
      format.html { redirect_to user_blogs_path(@user), notice: "Blog was successfully updated." }
      format.json { render :show, status: :ok, location: @blog }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @blog.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /blogs/1 or /blogs/1.json
def destroy
  @user = User.find(params[:user_id])
  @blog= Blog.find(params[:id])
  @blog.destroy

  respond_to do |format|
    format.html { redirect_to user_blogs_path(@user), notice: "Blog was successfully destroyed." }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
 # def set_user
  #  @user = User.find(params[:id])
 # end

  # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:title, :description)
  end

  
end
