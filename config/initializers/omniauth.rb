OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '790957556147-g9eh10673tj30b3ovej50bvh03oe8s1k.apps.googleusercontent.com', 
            'PJNSEL-H1weqJsJAaeo69y9v', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

