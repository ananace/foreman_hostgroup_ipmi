# frozen_string_literal: true

module ForemanHostgroupIpmi
  class Engine < ::Rails::Engine
    engine_name 'foreman_hostgroup_ipmi'

    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]

    # Add any db migrations
    initializer 'foreman_hostgroup_ipmi.load_app_instance_data' do |app|
      ForemanHostgroupIpmi::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer 'foreman_hostgroup_ipmi.register_plugin', :before => :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_hostgroup_ipmi do
        requires_foreman '>= 1.22'

        register_facet ForemanHostgroupIpmi::IpmiHostgroupFacet, :ipmi_hostgroup_facet do
          configure_hostgroup
        end

        parameter_filter Hostgroup, ipmi_hostgroup_facet_attributes: %i[username password provider]
      end
    end

    # Include concerns in this config.to_prepare block
    config.to_prepare do
      begin
        Hostgroup.send(:prepend, ForemanHostgroupIpmi::HostgroupExtensions)
      rescue StandardError => e
        Rails.logger.warn "ForemanHostgroupIpmi: skipping engine hook (#{e})\n#{e.backtrace.join("\n")}"
      end
    end
  end
end

