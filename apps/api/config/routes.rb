# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#

resources :assets, only: [:show, :index]
resources :products, only: [:show, :index]
resources :productions, only: [:index, :create, :destroy]
resources :asset_events, only: [:index]
resources :expenses, only: [:show, :index]
resources :sale_items, only: [:show, :index]

cors_handler = ->(env) {
  [
    204,
    {
      'Access-Control-Allow-Origin'  => Settings::Cors::CORS_ALLOW_ORIGIN,
      'Access-Control-Allow-Methods' => Settings::Cors::CORS_ALLOW_METHODS,
      'Access-Control-Allow-Headers' => Settings::Cors::CORS_ALLOW_HEADERS
    },
    []
  ]
}

options '/*', to: cors_handler
