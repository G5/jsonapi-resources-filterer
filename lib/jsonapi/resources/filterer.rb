require "jsonapi/resources/filterer/version"
require 'active_support/core_ext/class/attribute'
require 'filterer'
require 'jsonapi-resources'

module Jsonapi
  module Resources
    module Filterer
      extend ActiveSupport::Concern

      included do
        class_attribute :_filterer
        filterer filterer_class
      end

      module ClassMethods
        def filterer_class
          class_name = self.name.demodulize.gsub("Resource", "Filterer")
          module_name = self.name.deconstantize
          if module_name.empty?
            Object.const_get(class_name)
          else
            module_name.constantize.const_get(class_name)
          end
        end

        def filterer(filterer_class)
          self._filterer = filterer_class
        end

      end
    end
  end
end
