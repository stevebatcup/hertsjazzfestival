class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :set_device_type

  def festival_list
    @festival_list ||= Festival.where(is_current: false).order(year: :desc).all
  end
  helper_method :festival_list

  def current_festival
    @current_festival ||= Festival.where(is_current: true).first
  end
  helper_method :current_festival

  def is_home?
  	@is_home ||= params[:controller] == 'home'
  end
  helper_method :is_home?

  def device_image_size
    browser.device.mobile? ? :large : :small
  end
  helper_method :device_image_size

  def is_tablet?
    browser.device.tablet?
  end
  helper_method :is_tablet?


  def site_settings
    @site_settings ||= Rails.cache.fetch("site_settings") do
      settings = {}
      SiteSetting.all.each do |setting|
        if setting.value.present? && setting.value.length > 0
          settings[setting.name] = setting.value
        end
      end
      settings
    end
  end
  # helper_method :site_settings

  def site_setting(name)
    site_settings[name]
  end
  helper_method :site_setting

private
  def set_device_type
    if browser.device.mobile?
      request.variant = :mobile
    else
      request.variant = :desktop
    end
  end

end