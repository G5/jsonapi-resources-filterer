require "jsonapi/resources/filterer/version"
require 'active_support/core_ext/class/attribute'
require 'filterer'
require 'jsonapi-resources'

module JSONAPI
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
          filterer_class_from(module_name, class_name)
        end

        def filterer(filterer_class)
          self._filterer = filterer_class

          if self._filterer
            method_names = self._filterer.instance_methods.
              grep(/^param_\w+/)
            filter_names = method_names.map do |m|
              m.to_s.sub("param_", "").to_sym
            end
            filter_names -= self._allowed_filters.keys
            filters(*filter_names)
          end
        end

        def apply_filter(records, filter, value, _options = {})
          if self._filterer
            self._filterer.chain({filter => value}, {starting_query: records})
          else
            super(records, filter, value, _options = {})
          end
        end

        private

        def filterer_class_from(module_name, class_name)
          if module_name.empty?
            Object.const_get(class_name)
          else
            module_name.constantize.const_get(class_name)
          end
        rescue NameError => e
          nil
        end
      end

    end
  end
end
