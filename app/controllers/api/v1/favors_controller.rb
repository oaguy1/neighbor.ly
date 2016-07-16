class Api::V1::FavorsController < Api::V1Controller
  before_action :find_favor, only: [:update, :delete]

  def index
    @favors = Favor.where(user: @current_user)
    render json: @favors
  end

  def create
    favors = []
    favors_params['favors'].each do |favor_params|
      favor = Favor.new(
        title: favor_params[:title],
        message: favor_params[:message],
        favor_type: favor_params[:favor_type],
        user: @current_user
      )

      unless favor.valid? && favor.save
        render json: validation_error_message(favor) and return
      end

      location = Location.new(favor_params[:location])
      unless location.valid? && location.save
        render json: validation_error_message(location) and return
      end
      favor.location = location

      favor_params[:attached_images].each do |img|
        attached_image = AttachedImage.new(img)
        unless attached_image.valid? && attached_image.save
          render json: validation_error_message(attached_image) and return
        end
        favor.attached_images << attached_image
      end

      favors << favor
    end

    render json: favors
  end

  def update
    parsed_params = favor_params
    if parsed_params.include?(:location)
      parsed_params[:location] = Location.new(parsed_params[:location])
      unless parsed_params[:location].valid? && parsed_params[:location].save
        render json: validation_error_message(parsed_params[:location]) && return
      end
    end

    if parsed_params.include?(:attached_images)
      parsed_params[:attached_images] = parsed_params[:attached_images].collect do |img|
        attached_image = AttachedImage.new(img)
        unless attached_image.valid? && attached_image.save
          render json: validation_error_message(attached_image) && return
        end
        attached_image
      end
    end

    if @favor.update_attributes(parsed_params)
      render json: @favor
    else
      render json: validation_error_message(@favor)
    end
  end

  def destroy
    @favor.delete unless favor.blank?
  end

  private

  def find_favor
    @favor = Favor.where(id: params[:id]).first
    render nothing: true, status: :not_found && return unless favor.present?
  end

  def favors_params
    params.permit(favors: [:title, :message, :favor_type, location: [:lat, :lon], attached_images: [:url, :caption]])
  end

  def favor_params
    params.require(:favor).permit(:title, :message, :favor_type, location: [:lat, :lon], attached_images: [:url, :caption])
  end
end
