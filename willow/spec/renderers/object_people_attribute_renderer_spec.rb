require 'spec_helper'

RSpec.describe ObjectPeopleAttributeRenderer do
  describe 'Object People Attribute Renderer' do
    let(:value) do
      [
        {
          id: "6efb7d8f-5c4c-46e6-8049-faaded75114a",
          honorific_prefix: "Sir",
          given_name: "Lancelot",
          family_name: "O'Boyle",
          mail: "slance@gmail.com",
          object_person_role_ids: ["c32bf4b8-f5f5-4d89-9075-898c2fc8a659"],
          rdss_cdm_id: "sx61dm28w",
          object_person_roles: [
            {
              id: "c32bf4b8-f5f5-4d89-9075-898c2fc8a659",
              role_type: "contact_person",
              rdss_cdm_id: nil,
              object_person_ids: [
                "6efb7d8f-5c4c-46e6-8049-faaded75114a"
              ]
            }]
          }
        ].to_json
    end

    subject { Nokogiri::HTML(described_class.new(:object_organisation_roles, value).render) }

    describe 'Headers' do
      it 'has headers for Name, Email and Role' do
        headers = subject.css('.tr')[0].css('.th').map(&:text)
        expect(headers).to eq(%w[Name Email Roles])
      end
    end

    describe 'Values' do
      it 'has the correct values' do
        values = subject.css('.tr')[1].css('.td').map(&:text)
        expect(values).to eq(["Sir Lancelot O'Boyle", "slance@gmail.com", "Contact person"])
      end
    end
  end
end