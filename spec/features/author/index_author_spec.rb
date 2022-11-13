require 'rails_helper'

describe "Index page with all authors", type: :feature do
    it "should exists" do
        visit authors_path
    end

    it 'contains a table' do
        visit authors_path
        expect(page).to have_css 'table'
    end

    it 'has Name and Homepage table headers' do
        visit authors_path
        within 'table' do
            expect(page).to have_text 'Name'
            expect(page).to have_text 'Homepage'
        end
    end

    it 'has a link to create new authors' do
        visit authors_path
        expect(page).to have_link 'Create a new author here', href: new_author_path
    end

end