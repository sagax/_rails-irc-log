Irclog::Application.routes.draw do
  match '/'                          => 'message#view_root',        :as => 'root'
  match '/sitemap.:format'           => 'message#generate_sitemap', :as => 'sitemap'
  match ':channel'                   => 'message#view_channel',     :as => 'channel'
  match ':channel/:year'             => 'message#view_year',        :as => 'year'
  match ':channel/:year/:month'      => 'message#view_month',       :as => 'month'
  match ':channel/:year/:month/:day' => 'message#view_day',         :as => 'day'
end
