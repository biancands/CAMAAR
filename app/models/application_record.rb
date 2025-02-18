# A classe ApplicationRecord serve como a classe base para todos os modelos do aplicativo.
# Ela herda de ActiveRecord::Base e define a classe como uma classe abstrata primária.
# Todas as classes de modelo devem herdar de ApplicationRecord para compartilhar a funcionalidade comum.
#
# @abstract
#
# Exemplo de uso:
#   class User < ApplicationRecord
#     # código do modelo User
#   end
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
