class TranslationsController < ApplicationController
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def index
    locale = params[:locale] || I18n.default_locale
    translations = YAML.load_file(Rails.root.join('config', 'locales', "#{locale}.yml"))
    render json: translations
  end
end
