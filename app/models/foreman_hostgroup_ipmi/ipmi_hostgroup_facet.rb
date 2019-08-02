module ForemanHostgroupIpmi
  class IpmiHostgroupFacet < ApplicationRecord
    include Facets::HostgroupFacet

    validates_lengths_from_database
    validates :hostgroup, presence: true, allow_blank: false
  end
end

