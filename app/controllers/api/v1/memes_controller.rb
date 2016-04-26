module Api::V1
  class MemesController < ApiController
    def index # GET /memes
      @memes = Meme.all

      render json: @memes
    end

    def show # GET /memes/1
      @meme = Meme.find(params[:id])

      render json: @meme
    end

    def create # POST /memes
      @meme = Meme.new(meme_params)

      if @meme.save
        render json: @meme, status: :created, location: @meme
      else
        render json: @meme.errors, status: :unprocessable_entity
      end
    end

    private
    def meme_params # Only allow a trusted parameter "white list" through.
      params.require(:meme).permit(:url)
    end
  end
end
