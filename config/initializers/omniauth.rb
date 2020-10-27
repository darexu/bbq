Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, ENV['OMNIAUTH_VKONTAKTE_ID'], ENV['OMNIAUTH_VKONTAKTE_SECRET'],
    scope: 'email'
end
