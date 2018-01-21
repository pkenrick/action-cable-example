class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      respond_to do |format|
        format.html { redirect_to @chatroom }
        format.js
      end
    else
      flash[:notice] = { error: ["already exists"]}
      @chatrooms = Chatroom.all
      render :index
    end
  end

  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
  end

  def edit
    @chatroom = Chatroom.find_by(slug: params[:slug])
  end

  def update
    chatroom = Chatroom.find_by(slug: params[:slug])
    chatroom.update(chatroom_params)
    redirect_to chatroom
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end

end
