class CommentsController < ApplicationController
  
  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.create(comment_params)
    @comment.user_id = current_user.user_id
    
    if @comment.save
      redirect_to message_path(@message)
    else
      render 'new'
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private 
  
  def comment_params
    params.requre(:comment).permit(:content)
  end
end
