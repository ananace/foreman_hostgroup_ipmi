# frozen_string_literal: true

module ForemanHostgroupIpmi
  module HostgroupExtensions
    def self.prepended(base)
      base.class_eval do
        has_one :ipmi_hostgroup_facet,
                class_name: '::ForemanHostgroupIpmi::IpmiHostgroupFacet',
                dependent: :destroy
      end
    end

    def ensure_ipmi_hostgroup_facet(provider = nil)
      ipmi_hostgroup_facet || build_ipmi_hostgroup_facet(provider: provider)
      # ipmi_hostgroup_facets.first || ipmi_hostgroup_facets.new provider: provider
    end
  end
end

