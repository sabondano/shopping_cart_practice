require 'rails_helper'

feature "Visitor adds an item to their cart" do
  scenario "not logged with an empty cart" do
    item = Item.create(name: "Item 1")

    visit item_path(item)
    click_button "Add to cart"
    expect(current_path).to eq(root_path)
    visit item_path(item)
    click_button "Add to cart"
    click_link "Cart"

    within(".name") do
      expect(page.body).to have_content("Item 1")
    end

    within(".quantity") do
      expect(page.body).to have_content("2")
    end
  end
end
