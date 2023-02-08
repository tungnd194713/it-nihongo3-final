class ReviewRepliesController < ApplicationController
  before_action :set_book, only: [:show,:edit, :update, :destroy]
  before_action :set_review, only: [:show,:edit, :update, :destroy]
  before_action :set_review_reply, only: [:edit, :update, :destroy]

  # GET /review_replies or /review_replies.json
  def index
    @review_replies = ReviewReply.all
  end

  # GET /review_replies/1 or /review_replies/1.json
  def show
  end

  # GET /review_replies/new
  def new
    @review_reply = ReviewReply.new
  end

  # GET /review_replies/1/edit
  def edit
  end

  # POST /review_replies or /review_replies.json
  def create
    @review_reply = ReviewReply.new(review_reply_params)

    respond_to do |format|
      if @review_reply.save
        format.html { redirect_to book_url(@book), notice: "Review reply was successfully created." }
        format.json { render :show, status: :created, location: @review_reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /review_replies/1 or /review_replies/1.json
  def update
    respond_to do |format|
      if @review_reply.update(review_reply_params)
        format.html { redirect_to book_url(@book), notice: "Review reply was successfully updated." }
        format.json { render :show, status: :ok, location: @review_reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_replies/1 or /review_replies/1.json
  def destroy
    @review_reply.destroy

    respond_to do |format|
      format.html { redirect_to book_url(@book), notice: "Review reply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_book
      @book = Book.find(params[:book_id])
    end
    def set_review
      @review = Review.find(params[:review_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_review_reply
      @review_reply = ReviewReply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_reply_params
      params.require(:review_reply).permit(:review_id, :comment,:user_id)
    end
end
