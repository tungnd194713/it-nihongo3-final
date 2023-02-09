class SearchController < ApplicationController
  before_action :set_categories
    def index
        if params[:term]
            @books= if !params[:category_id].blank?
              Book.where('title LIKE ?', "%#{params[:term]}%").where('category_id = ?', params[:category_id])
            .or(Book.where('author LIKE ?', "%#{params[:term]}%").where('category_id = ?', params[:category_id]))
            
            else
              Book.where('title LIKE ?', "%#{params[:term]}%")
            .or(Book.where('author LIKE ?', "%#{params[:term]}%"))
            end

          else
            @books= if !params[:category_id].blank?
            Book.where('category_id = ?', params[:category_id])
            else
              Book.limit(20)
            end
          end
        
    end
    private
    def search_params
        params.require(:category).permit(:category_id)
        params.permit(:term)
    end
    def set_categories
      @categories = Category.all.map{ |c| [c.name, c.id] }
    end
end
