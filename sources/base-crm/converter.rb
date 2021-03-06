
class Converter

  def configure(rootmodel)
    # add custom field to your model here. Custom fields can be
    # added to organization, deal and person. Valid types are
    # :String and :Link. If no type is specified :String is used
    # as default.
    rootmodel.settings.with_organization do |organization|

    end

    rootmodel.settings.with_deal do |deal|
        deal.add_status({:label => "Prospecting", :integration_id => "Prospecting"})
        deal.add_status({:label => "Qualified", :integration_id => "Qualified"})
        deal.add_status({:label => "Won", :integration_id => "Won",
                            :assessment => MoveToGo::DealState::PositiveEndState })
        deal.add_status({:label => "Lost", :integration_id => "Lost",
                            :assessment => MoveToGo::DealState::NegativeEndState })
    end
  end

  def to_organization(row, rootmodel)

    organization = MoveToGo::Organization.new
    # All built in fields are automagically mapped. Add your custom stuff here...

    return organization
  end

  def to_organization_from_lead(row, rootmodel)
    organization = MoveToGo::Organization.new
    # All built in fields are automagically mapped. Add your custom stuff here...
    return organization
  end

  def to_coworker(row)
        coworker = MoveToGo::Coworker.new
    # All built in fields are automagically mapped. Add your custom stuff here...
        return coworker
  end

  def to_person(row, rootmodel)
        person = MoveToGo::Person.new
    # All built in fields are automagically mapped. Add your custom stuff here...
    return person
  end

  def to_deal(row, rootmodel)
    deal = MoveToGo::Deal.new
    # All built in fields are automagically mapped. Add your custom stuff here...
    deal.status = rootmodel.settings.deal.find_status_by_label row['stage_name']
    return deal
  end

end
