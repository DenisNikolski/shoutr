class ShoutsController < ApplicationController
  def show
    @shout = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.create(shout_params)
    redirect_to root_path, redirect_options_for(shout)
  end

  private

  def shout_params
    { content: content_from_params }
  end

  def content_from_params
    case params.dig(:shout, :content_type).to_sym
    when :text_shout then TextShout.new(text_shout_content_params)
    when :photo_shout then PhotoShout.new(photo_shout_content_params)
    end
  end

  def text_shout_content_params
    params.require(:shout).require(:content).permit(:body)
  end

  def photo_shout_content_params
    params.require(:shout).require(:content).permit(:image)
  end

  def redirect_options_for(shout)
    shout.persisted? ? { notice: 'Shouted successfully' } : { alert: 'Could not shout' }
  end
end
