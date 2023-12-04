class CoffeesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
      if params[:search] == nil
        @coffees= Coffee.all
      elsif params[:search] == ''
        @coffees= Coffee.all
      else
        #部分検索
        @coffees = Coffee.where("body LIKE ? ",'%' + params[:search] + '%')
      end
      @coffees = @coffees.page(params[:page]).per(2)
    end

    def new
        @coffee = Coffee.new
    end
    
    def create
        coffee = Coffee.new(coffee_params)
        coffee.user_id = current_user.id
        if coffee.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @coffee = Coffee.find(params[:id])
        @comments = @coffee.comments
        @comment = Comment.new
    end

    def edit
        @coffee = Coffee.find(params[:id])
    end

    def update
        coffee = Coffee.find(params[:id])
        if coffee.update(coffee_params)
          redirect_to :action => "show", :id => coffee.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        coffee = Coffee.find(params[:id])
        coffee.destroy
        redirect_to action: :index
    end

    private
    def coffee_params
    params.require(:coffee).permit(:name, :area, :image, :body)
    end
end
