require 'rails_helper'

describe "page to edit authors", type: :feature do
    it "creates edit page" do
        @alan = FactoryBot.create :author
        @alan.save
        visit edit_author_path(@alan)
    end

    it "should have the right form" do
        @alan = FactoryBot.create :author
        @alan.save
        visit edit_author_path(@alan)

        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

    it "should update correctly" do
        @alan = FactoryBot.create :author
        @alan.save
        visit edit_author_path(@alan)

        expect(@alan.first_name).to eq('Alan')
        page.fill_in 'author[first_name]', with: 'Elan'
        find('input[type="submit"]').click
        @alan.reload
        expect(@alan.first_name).to eq('Elan')
    end
end