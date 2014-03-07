
module FruitToLime
    class Deal
        include SerializeHelper, ModelHasCustomFields, ModelHasTags

        attr_accessor :id, :integration_id, :description, :probability, :value, :order_date, :offer_date, :customer, :responsible_coworker
        attr_reader :custom_fields

        def serialize_variables
            [ :id, :integration_id, :description, :probability, :value, :offer_date, :order_date ].map {
                |p| {
                    :id => p,
                    :type => :string
                }
            } +
                [
                 { :id => :customer, :type => :organization_reference },
                 { :id => :responsible_coworker, :type => :coworker_reference },
                 { :id => :custom_fields, :type => :custom_fields },
                 { :id => :tags, :type => :tags }
                ]
        end

        def serialize_name
            "Deal"
        end

        def initialize()
        end

        def set_custom_field_DELETE(obj)
            @custom_fields = [] if @custom_fields==nil
            @custom_fields.push CustomField.new(obj)
        end

        def to_s
            return "deal[id=#{@id}, integration_id=#{@integration_id}]"
        end
    end
end