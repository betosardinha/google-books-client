# frozen_string_literal: true

require "delegate"

module GoogleBooksClient
  module Models
    class Base < SimpleDelegator
      def initialize(entity, args = {})
        super(entity)
        @args = args
      end

      def self.serialize(entity, args = {})
        return serialize_all(entity) if entity.respond_to?(:each)

        new(entity, args).as_json
      end

      def self.serialize_all(entities)
        entities.map { |entity, args| serialize(entity, args) }
      end

      def as_json
        required_fields_hash.tap do |hash|
          hash.merge!(optional_fields)

          default_additional_params.each do |key, value|
            next hash.store(key, value) if hash[key].is_a?(Hash)

            hash[key] = value
          end
        end.as_json
      end

      def required_fields
        raise NoMethodError, "You must implement #{self.class}##{__method__}"
      end

      def optional_fields
        {}
      end

      def default_additional_params
        {}
      end

      private

      attr_reader :args

      def required_fields_hash
        validate_presence_of_required_fields!
        validate_presence_of_required_fields_values!

        {}.tap do |hash|
          required_fields.each do |field|
            hash.store(field.to_sym, send(field.to_sym))
          end
        end
      end

      def validate_presence_of_required_fields!
        required_fields.each do |field|
          next if self.class.instance_methods(false).include?(field.to_sym)

          raise NoMethodError, "Missing required field #{field} for #{self.class}"
        end
      end

      def validate_presence_of_required_fields_values!
        required_fields.each do |field|
          next unless send(field.to_sym).nil?

          raise NoMethodError, "Missing required field #{field} value for #{self.class}"
        end
      end
    end
  end
end
