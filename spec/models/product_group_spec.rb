require 'spec_helper'

describe ProductGroup do

  before do
    @product_group = FactoryGirl.create(:product_group)
  end

  subject { @product_group }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:published) }
  it { should respond_to(:product_nr_prefix)}
  it { should respond_to(:logo) }
  it { should respond_to(:background_color) }
  
  describe "when name is not present" do
    before { @product_group.name = nil }
    it { should_not be_valid }
  end

  describe "product associations" do
    it { should respond_to(:products) }

    let!(:product_group){ FactoryGirl.create(:product_group, product_nr_prefix: "111") }
    let!(:product_in_range){ FactoryGirl.create(:product, product_nr: "111-11111111") }
    let!(:product_not_in_range){ FactoryGirl.create(:product, product_nr: "999-99999999") }

    describe "product_nr_prefix filters products out" do
      specify { expect(product_group.products).to include(product_in_range) }
      specify { expect(product_group.products).to_not include(product_not_in_range) }
    end
  end
  
  describe "PaperClip Attachment for logo" do
    it { should have_attached_file(:logo) }
    it { should validate_attachment_content_type(:logo).
         allowing("image/jepg", "image/jpg", "image/gif", "image/png").
         rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:logo).
          less_than(2.megabytes) }
  end

end
