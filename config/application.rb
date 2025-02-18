require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Módulo principal da aplicação Camaar.
# 
# Este módulo encapsula toda a aplicação Rails e suas configurações principais.
module Camaar
  # Configuração principal da aplicação Camaar.
  #
  # Esta classe define configurações globais, incluindo:
  # - Definição do idioma padrão (`pt-BR`).
  # - Configuração de autoload para a pasta `lib/`.
  # - Inicialização com as configurações padrão do Rails 8.0.
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Define o idioma padrão como Português do Brasil
    config.i18n.default_locale = :'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
