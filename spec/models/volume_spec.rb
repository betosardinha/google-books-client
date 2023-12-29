# frozen_string_literal: true

class VolumeSerializer < GoogleBooksClient::Models::Volume
  def id
    "123"
  end

  def kind
    "books#volume"
  end

  def volume_info
    {
      title: "The Great Gatsby",
      authors: ["F. Scott Fitzgerald"],
      publisher: "Scribner",
      published_date: "2003-05-27"
    }
  end

  def optional_fields
    {
      param1: "value1",
      param2: "value2"
    }
  end
end

RSpec.describe GoogleBooksClient::Models::Volume do
  it_behaves_like "a serializer model" do
    let(:serializer) { VolumeSerializer }
    let(:required_fields) { %i[id kind volume_info] }
    let(:additional_params) { { "aditional_param" => "value" } }
    let(:expected_json) do
      {
        "id" => "123",
        "kind" => "books#volume",
        "volume_info" => {
          "title" => "The Great Gatsby",
          "authors" => ["F. Scott Fitzgerald"],
          "publisher" => "Scribner",
          "published_date" => "2003-05-27"
        },
      }
    end

    let(:optional_json) { { "param1" => "value1", "param2" => "value2" } }
  end
end
