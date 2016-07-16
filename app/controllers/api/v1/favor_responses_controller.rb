class Api::V1::FavorResponsesController < Api::V1Controller
  before_action :find_favor
  before_action :validate_favor, only: [:create, :update, :destroy]
  before_action :find_favor_response, only: [:update, :destroy]

  def index
    @favor_responses = FavorResponse.where(user: @current_user)
    @favor_responses = @favor_responses.where(favor: @favor) unless @favor.blank?
    render json: @favor_responses
  end

  def create
    @favor_response = FavorResponse.new(favor_response_params)
    @favor_response.favor = @favor
    @favor_response.user = @current_user

    if @favor_response.valid? && @favor_response.save
      render json: @favor_response
    else
      render json: validation_error_message(@favor_response)
    end
  end

  def update
    if @favor_response.update_attributes(favor_response_params)
      render json: @favor_response
    else
      render json: validation_error_message(@favor_response)
    end
  end

  def destroy
    @favor_response.delete
  end

  private

  def find_favor
    @favor = Favor.where(id: params[:favor_id]).first
  end

  def validate_favor
    @favor ||= find_favor
    render nothing: true, status: :not_found && return unless @favor.present?
  end

  def validate_favor_response
    @favor_response = FavorResponse.where(id: params[:id]).first
    render nothing: true, status: :not_found && return unless @favor_response.present?
  end

  def favor_response_params
    params.require(:favor_response).permit(:can_help_at, :comment)
  end
end
