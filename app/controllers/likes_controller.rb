class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def create
    @like = Like.new(like_params)
    respond_to do |format|
      if @like.save
        format.html { redirect_to posts_url }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { redirect_to posts_url }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
      params.require(:like).permit(:post_id, :user_id)
    end
end
