require 'rails_helper'

describe "Showing the authors page", type: :feature do
    it "should show an author page for Alan Turing" do
        @alan = FactoryBot.create :author
        visit author_path(@alan)

        expect(page).to have_text('Alan Turing')
    end
end