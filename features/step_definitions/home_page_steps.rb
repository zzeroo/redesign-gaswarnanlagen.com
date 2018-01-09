Given(/^there's a category named "(.*?)" with true published$/) do |cat_name|
  @category = FactoryBot.create(:category, name: cat_name, published: true )
end

Given(/^none parent$/) do
  expect(@category.parent).to be_nil
end

When(/^I am on the homepage$/) do
  visit "/"
end

Then(/^I should see the "(.*?)" category$/) do |cat_name|
  @category = Category.find_by_name(cat_name)
  expect(page).to have_content(@category.name)
  expect(page).to have_content(@category.description)
end

Given(/^a global administrator named "(.*?)"$/) do |arg1|
  @admin =  FactoryBot.build(:admin)
end

Given(/^a category named "(.*?)" without "(.*?)"$/) do |arg1, arg2|
    @category = FactoryBot.create(:category, published: true)
end

