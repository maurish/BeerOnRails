require 'spec_helper'

describe "Rating" do
    include OwnTestHelper
    let!(:user) { FactoryGirl.create :user }
    let!(:brewery1) { FactoryGirl.create :brewery, :name => "Koff" }
    let!(:brewery2) {FactoryGirl.create :brewery, name:"Karjala"}
    let!(:beer1) { FactoryGirl.create :beer, :name => "iso 3", :brewery => brewery1, style:'Lager' }
    let!(:beer2) { FactoryGirl.create :beer, :name => "Karhu", :brewery => brewery2, style:'Pale Ale' }
    before :each do
        sign_in user.username, user.password
    end

    it 'page should have no ratings if no ratings yet given' do
        visit ratings_path
        expect(page).to have_content 'List of ratings'
        expect(page).to have_content 'Number of ratings: 0'
    end


    it "when given, is registered to the beer and user who is signed in" do
            visit new_rating_path
            select(beer1.to_s, :from => 'rating[beer_id]')
            fill_in('rating[score]', :with => '15')

            expect{
                click_button "Create Rating"
            }.to change{Rating.count}.from(0).to(1)

            expect(user.ratings.count).to eq(1)
            expect(beer1.ratings.count).to eq(1)
            expect(beer1.average_rating).to eq(15.0)
        end

    describe 'when ratings have been given' do 
        include OwnTestHelper
        
        before :each do 
            @rating1 = FactoryGirl.create :rating, user:user, beer:beer1, score:10
            @rating2 = FactoryGirl.create :rating, user:user, beer:beer2, score:20
        end

        it 'shows all the ratings in the db' do
            visit ratings_path
            Rating.all.each do |r|
                expect(page).to have_content r.score
                expect(page).to have_content r.user.username
                expect(page).to have_content r.beer.name
            end
        end


        it 'shows all ratings given in the user page' do 
            visit user_path user
            user.ratings.each do |r|
                expect(page).to have_content r.score
                expect(page).to have_content r.beer.name
            end

        end

        it 'after clicking destroy, will be destroyed' do
            visit user_path user
            expect{
                find("#rating-#{@rating1.id}").find('a').click()
            }.to change{user.ratings.count}.by(-1)
            
            expect(page).to have_content 'Rating successfully destroyed'
            expect(page).not_to have_content @rating1.score
            expect(page).not_to have_content @rating1.beer.name
            expect(page).to have_content @rating2.score
            expect(page).to have_content @rating2.beer.name


        end


        it 'shows favorite style at the user page' do 
            visit user_path user
            expect(page).to have_content 'favorite style is: Pale Ale'
        end

        it 'shows favorite brewery at the user page' do 
            visit user_path user
            expect(page).to have_content 'favorite brewery is: Karjala'
        end

    end


end