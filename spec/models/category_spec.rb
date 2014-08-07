require 'spec_helper'

describe Category do

  before do
    @category = FactoryGirl.create(:category)
  end

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:published) }
  it { should respond_to(:product_nr_prefix)}
  it { should respond_to(:logo) }
  it { should respond_to(:background_color) }
  
  describe "when name is not present" do
    before { @category.name = nil }
    it { should_not be_valid }
  end

  describe "product associations" do
    it { should respond_to(:products) }

    let!(:category){ FactoryGirl.create(:category, product_nr_prefix: "111") }
    let!(:product_in_range){ FactoryGirl.create(:product, product_nr: "111-11111111") }
    let!(:product_not_in_range){ FactoryGirl.create(:product, product_nr: "999-99999999") }

    describe "product_nr_prefix filters products out" do
      specify { expect(category.products).to include(product_in_range) }
      specify { expect(category.products).to_not include(product_not_in_range) }
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


  describe "format of background_color" do
    describe "empty background_color" do
      before { @category.background_color = nil }
      it { should be_valid }
    end

    describe "hash plus six right chars" do
      before { @category.background_color = "#FFFFFF" }
      it { should be_valid }
    end

    describe "hash plus three right chars" do
      before { @category.background_color = "#FFF" }
      it { should be_valid }
    end

    describe "without hash in front" do
      before { @category.background_color = "FFFFFF" }
      it { should_not be_valid }
    end

    describe "less then three chars" do
      before { @category.background_color = "#FF" }
      it { should_not be_valid }
    end

    describe "more then six chars" do
      before { @category.background_color = "#FFFFFFF" }
      it { should_not be_valid }
    end

    describe "other then #[0-9a-fA-F]" do
      before { @category.background_color = "#zzZZzz" }
      it { should_not be_valid }
    end
  end

  describe "Validation Categories" do
    let!(:parent) { FactoryGirl.create(:category) }

    before do
      parent.parent_id = parent.id
    end

    it "can't be parent of her self" do
      subject{ parent.save! }.should_not eq(true)
    end

    it "should print out a short error description" do
      cat = Category.new(name: "foo", id: 12345, parent_id: 12345)

      cat.valid?  # trigger validation to run (without saving)
      cat.errors[:parent_id].should include I18n.t('activerecord.errors.models.category.attributes.parent_id.parent_not_self')
    end


  end
end
