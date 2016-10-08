class AddDomainToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :domain, :string
  end
end
