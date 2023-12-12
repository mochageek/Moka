class CoffeesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
      @coffees = Coffee.all
      search = params[:search]
      @coffees = @coffees.page(params[:page]).per(2)
      @coffees = @coffees.joins(:user).where("shop LIKE ? OR area LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") if search.present?
      if params[:tag]
        Tag.create(name: params[:tag])
      end
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

    def tagall

        @coffees = Coffee.all
        search = params[:search]
        @coffees = @coffees.joins(:user).where("shop LIKE ? OR area LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") if search.present?
        if params[:tag]
         Tag.create(name: params[:tag])
        end

        if params[:tag_ids]
          @coffees = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_coffees = Tag.find_by(name: key).coffees
              @coffees = @coffees.empty? ? tag_coffees : @coffees & tag_coffees
            end
          end
        end

    end


    private
    def coffee_params
      params.require(:coffee).permit(:shop, :area, :image, :body, :lat, :lng, tag_ids: [])
    end
    
end
