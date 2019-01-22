Foo = Struct.new(:id, :name, :bar, :limbs, :feet, :ear)
Bar = Struct.new(:id)
Limb = Struct.new(:id)

class FooSerizalizer < Api::Serializers::Serializer
  attributes :id, :name
  has_one :bar
  has_one :ear
  has_many :limbs
  has_many :feet
end

describe Api::Serializers::Serializer do
  subject { FooSerizalizer.new(foo) }
  let(:foo) { Foo.new id, name, bar, limbs, nil, nil }
  let(:id) { 42 }
  let(:name) { 'foo' }

  let(:bar) { Bar.new(bar_id) }
  let(:bar_id) { 727 }

  let(:limbs) { [Limb.new(limb_id)] }
  let(:limb_id) { 84 }

  let(:serialized) { subject.to_h }

  it 'serializes the record' do
    expected = {
      id: id,
      type: 'foos',
      attributes: {
        name: name
      },
      relationships: {
        bar: {
          data: {
            id: bar_id,
            type: 'bars'
          }
        },
        ear: {
          data: {}
        },
        limbs: {
          data: [
            {
              id: limb_id,
              type: 'limbs'
            }
          ]
        },
        feet: {
          data: [
          ]
        }
      }
    }
    expect(serialized).to eq expected
  end
end
