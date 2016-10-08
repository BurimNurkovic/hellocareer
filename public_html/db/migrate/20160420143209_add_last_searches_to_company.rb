class AddLastSearchesToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :last_searches, :json, default: {}
  end
end
