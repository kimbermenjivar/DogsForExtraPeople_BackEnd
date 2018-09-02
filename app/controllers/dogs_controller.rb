class DogsController < OpenReadController
  before_action :set_dog, only: [:show, :update, :destroy]

  # GET /dogs
  def index
    @dogs = Dog.all

    render json: @dogs
  end

  # GET /dogs/1
  def show
    render json: @dog
  end

  # POST /dogs
  def create
    # @dog = Dog.new(dog_params)
    @dog =current_user.dogs.build(dog_params)
    if @dog.save
      render json: @dog, status: :created, location: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dogs/1
  def update
    if current_user.id == @dog.user_id && @dog.update(dog_params)
      render json: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dogs/1
  def destroy
    if current_user.id == @dog.user_id
      @dog.destroy
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dog_params
      params.require(:dog).permit(:breed, :size, :fur, :user_id)
    end
end
