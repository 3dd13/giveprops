class AddPortfolioImageToImages < ActiveRecord::Migration
  def change
    add_column :images, :portfolio_image, :string
  end
end
