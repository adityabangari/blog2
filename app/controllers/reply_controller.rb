class ReplyController < ApplicationController

def new
@reply = Reply.new
end

  def create
byebug
    @reply= Reply.create(reply_params)

 redirect_to article_path( @reply)
  end

  def show
    @reply=Reply.find(params[:comment_id])
  end

def edit

end

  def update

  end

  def destroy

  end


private
def reply_params
  params.require(:reply).permit(:reply, :comment_id)
end

end
