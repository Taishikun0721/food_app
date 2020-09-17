module CreateFoodSupport
  def create_food(user, description)
    click_link 'New Post'
    fill_in 'foods_description', with: description
    image_example = File.join(Rails.root, 'spec/factories/images/after.png')
    attach_file 'food_image', image_example, make_visible: true
    select 'lunch', from: 'food_category_id'
    expect {
      find('.btn.btn-default.text-white.mt-5.btn-round').click
    }.to change(user.foods, :count).by(1)
  end

end
RSpec.configure do |config|
  config.include CreateFoodSupport
end