# Output OrganisationRole Organisation data
class ObjectOrganisationAttributeRenderer
  include Concerns::CssTableRenderer

  # rubocop:disable Layout/MultilineOperationIndentation
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  # Outputs a CSS table from a OrganisationRole related OrganisationRole
  # object
  def render(organisation)
    table do
      thead do
        row do
          header { I18n.t('headers.rdss_cdm.jisc_id') } +
          header { I18n.t('headers.rdss_cdm.organisation_name') }
        end
      end +
      tbody do
        row do
          cell { Cdm::AutoRenderer.(organisation.jisc_id) } +
          cell { Cdm::StringRenderer.(organisation.name) }
        end
      end
    end
  end

  private

  def type(organisation_type)
    I18n.t("rdss.organisation_type.#{organisation_type.downcase}")
  end
end
