require 'spec_helper'

describe CategoriesHelper do

  describe "#categories_for_select" do

    describe "without categories" do
      it "returns a array" do
        expect(helper.categories_for_select).to eq([])
      end
    end

    describe "with categories" do
      let!(:category1) { FactoryGirl.create(:category, name: "Category 1", id: 666) }

      it "returns a array of categories and id" do
        expect(helper.categories_for_select).to eq([["Category 1 [Hauptkategorie]", 666]])
      end
    end

    describe "multiple categories" do
      let!(:category1) { FactoryGirl.create(:category, name: "Category 1", id: 1) }
      let!(:category2) { FactoryGirl.create(:category, name: "Category 2", id: 2) }

      it "returns a array of categories and id" do
        expect(helper.categories_for_select).to include(["Category 1 [Hauptkategorie]", 1])
        expect(helper.categories_for_select).to include(["Category 2 [Hauptkategorie]", 2])
      end

      describe "with sub category" do
        let!(:category1) { FactoryGirl.create(:category, name: "Category 1", description: "", id: 1) }
        let!(:category2) { FactoryGirl.create(:category, name: "Category 2", description: "", id: 2) }
        let!(:category3) { FactoryGirl.create(:category, name: "Sub Category 1.1", description: "", id: 3, parent_id: 1) }

        it "returns a array of categories and id" do
          expect(helper.categories_for_select).to eq([
            ["Category 1 [Hauptkategorie]", 1],
            ["...Sub Category 1.1", 3],
            ["Category 2 [Hauptkategorie]", 2]
          ])
        end
      end

      describe "with many root and many sub category" do
        let!(:category1) { FactoryGirl.create(:category, name: "Root Category 1", description: "", id: 1) }
        let!(:category2) { FactoryGirl.create(:category, name: "Root Category 2", description: "", id: 2) }
        let!(:category3) { FactoryGirl.create(:category, name: "Sub Category 1.1", description: "", id: 3, parent_id: 1) }
        let!(:category4) { FactoryGirl.create(:category, name: "Sub Sub Category 1.1.1", description: "", id: 4, parent_id: 3) }
        let!(:category5) { FactoryGirl.create(:category, name: "Root Category 3", description: "", id: 5) }
        let!(:category6) { FactoryGirl.create(:category, name: "Sub Category 3.1", description: "", id: 6, parent_id: 5) }
        let!(:category7) { FactoryGirl.create(:category, name: "Sub Sub Category 3.1.1", description: "", id: 7, parent_id: 6) }

        it "returns a array of categories and id" do
          expect(helper.categories_for_select).to eq([
            ["Root Category 1 [Hauptkategorie]", 1],
            ["...Sub Category 1.1", 3],
            ["...Sub Sub Category 1.1.1", 4],
            ["Root Category 2 [Hauptkategorie]", 2],
            ["Root Category 3 [Hauptkategorie]", 5],
            ["...Sub Category 3.1", 6],
            ["...Sub Sub Category 3.1.1", 7],
          ])
        end
      end
    end

  end
end
