class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit # подключить функционал Пандита ко всем контроллерам
  # Обработать ошибку авторизации
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Настройка для работы девайза при правке профиля юзера
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  # Хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit?

  # Настройка для девайза — разрешаем обновлять профиль, но обрезаем
  # параметры, связанные со сменой пароля.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )
  end

  # Вспомогательный метод, возвращает true, если текущий залогиненный юзер
  # может править указанную модель. Обновили метод — теперь на вход принимаем
  # event, или «дочерние» объекты
  def current_user_can_edit?(model)
    # Если у модели есть юзер и он залогиненный, пробуем у модели взять .event и
    # если он есть, проверяем его юзера на равенство current_user.
    # user_signed_in? метод Devise
    user_signed_in? && (
    model.user == current_user || # хозяин ли?
      (model.try(:event).present? && model.event.user == current_user) # юзер хозяин события?
    )
  end

  private

  def user_not_authorized
    # Перенаправляем юзера откуда пришел (или в корень сайта)
    # с сообщением об ошибке (для секьюрности сообщение ЛУЧШЕ опустить!)
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end
