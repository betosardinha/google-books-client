# frozen_string_literal: true

RSpec.shared_examples "a serializer model" do
  describe ".serialize_all" do
    let(:entities) { [Object.new, Object.new] }

    it "returns json with required and optional fields" do
      expect(serializer.serialize_all(entities)).to eq([expected_json.merge(optional_json)] * 2)
    end
  end

  describe ".serialize" do
    it "returns json with required and optional fields" do
      expect(serializer.serialize(Object.new)).to eq(expected_json.merge(optional_json))
    end

    context "when there are not optional fields" do
      before { allow_any_instance_of(serializer).to receive(:optional_fields).and_return({}) }

      it "returns json with required fields only" do
        expect(serializer.serialize(Object.new)).to eq(expected_json)
      end
    end

    context "when more than one entity is passed" do
      let(:entities) { [Object.new, Object.new] }

      it "returns json with required and optional fields" do
        expect(serializer.serialize(entities)).to eq([expected_json.merge(optional_json)] * 2)
      end
    end

    context "when there are missing required fields" do
      let(:expected_message) { "Missing required field #{required_fields[0]} for #{serializer}" }

      before do
        required_fields.each { |field| serializer.undef_method field.to_sym }
      end

      it "raises a NoMethodError" do
        expect { serializer.serialize(Object.new) }.to raise_error(NoMethodError, expected_message)
      end
    end

    context "when required fields are blank" do
      let(:expected_message) { "Missing required field #{required_fields[0]} value for #{serializer}" }

      before do
        required_fields.each { |field| allow_any_instance_of(serializer).to receive(field.to_sym).and_return(nil) }
      end

      it "raises a NoMethodError" do
        expect { serializer.serialize(Object.new) }.to raise_error(NoMethodError, expected_message)
      end
    end
  end

  describe "#required_fields" do
    it "returns an array of required fields" do
      expect(serializer.new(Object.new).required_fields).to eq(required_fields)
    end

    context "when required_fields is not implemented" do
      let(:expected_message) { "You must implement #{serializer}#required_fields" }

      let(:serializer) { Class.new(GoogleBooksClient::Models::Base) }

      it "raises a NoMethodError" do
        expect { serializer.new(Object.new).required_fields }.to raise_error(NoMethodError, expected_message)
      end
    end
  end

  describe "#optional_fields" do
    context "when optional_fields is not implemented" do
      let(:serializer) { Class.new(GoogleBooksClient::Models::Base) }

      it "returns an empty hash" do
        expect(serializer.new(Object.new).optional_fields).to eq({})
      end
    end
  end

  describe "#default_additional_params" do
    context "when default_additional_params is not implemented" do
      let(:serializer) { Class.new(GoogleBooksClient::Models::Base) }

      it "returns an empty hash" do
        expect(serializer.new(Object.new).default_additional_params).to eq({})
      end
    end
  end
end
