module Api::V1
  class MemesController < ApiController
    # GET /memes
    def index
      @memes = Meme.all

      render json: @memes
    end

    # GET /memes/:id
    def show
      @meme = Meme.find(params[:id])

      render json: @meme
    end

    # POST /memes
    def create
      @meme = Meme.new(meme_params)

      if @meme.save
        render json: @meme, status: :created, location: @meme
      else
        render json: @meme.errors, status: :unprocessable_entity
      end
    end

    # POST /memes/upvote/:id
    def upvote
      @meme = Meme.find(params[:id])

      render json: @meme.upvote
    end

    # POST /memes/downvote/:id
    def downvote
      @meme = Meme.find(params[:id])

      render json: @meme.downvote
    end

    private
    def meme_params
      params.require(:meme).permit(:url)
    end
  end
end
