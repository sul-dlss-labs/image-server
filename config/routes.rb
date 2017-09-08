Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # RIIIF doesn't allow us to pass our very permissive id routing constraints, so we're providing our own
  # routes instead.
  # mount Riiif::Engine => '/image-service', as: 'riiif'

  ALLOW_ANYTHING_BUT_SLASHES = /[^\/]+/

  constraints id: ALLOW_ANYTHING_BUT_SLASHES, rotation: Riiif::Routes::ALLOW_DOTS, size: Riiif::Routes::SIZES do
    get "/image-service/:id/:region/:size/:rotation/:quality.:format" => 'riiif/images#show',
        defaults: { format: 'jpg', rotation: '0', region: 'full', quality: 'default', model: 'riiif/image' },
        as: 'riiif_image'

    get "/image-service/:id/info.json" => 'riiif/images#info',
        defaults: { format: 'json', model: 'riiif/image' },
        as: 'riiif_info'

    # This doesn't work presently
    # get "#{route_prefix}/:id", to: redirect("#{route_prefix}/%{id}/info.json")
    get "/image-service/:id" => 'riiif/images#redirect', as: 'riiif_base'
  end
end
