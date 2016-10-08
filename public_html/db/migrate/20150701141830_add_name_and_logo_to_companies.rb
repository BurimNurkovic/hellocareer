class AddNameAndLogoToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :logo, :string
    add_column :companies, :name, :string
  end
end
