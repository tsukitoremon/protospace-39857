class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :update]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

def create
    @prototype = Prototype.new(prototype_params) 
    if @prototype.save
    redirect_to '/'
    else
      render :new, status: :unprocessable_entity
   end
end

  

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    unless current_user == @prototype.user
      redirect_to root_path
  end

  def update
   if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
   else
    render :edit, status: :unprocessable_entity
   end
  end

    end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

    def move_to_edit
    unless @prototype && current_user.id == @prototype.user_id
        redirect_to action: :index
    end
end
end

 
