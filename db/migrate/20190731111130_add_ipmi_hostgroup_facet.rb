# frozen_string_literal: true

class AddIpmiHostgroupFacet < ActiveRecord::Migration[5.1]
  def change
    create_table :ipmi_hostgroup_facets do |t|
      t.references :hostgroup, null: false, foreign_key: true
      t.string :provider, null: false, limit: 255
      t.string :username, limit: 255
      t.string :password, limit: 255

      t.timestamps null: false
    end

    add_index :ipmi_hostgroup_facets, [:hostgroup_id, :provider], :name => 'idx_by_hostgroup_provider'
  end
end

