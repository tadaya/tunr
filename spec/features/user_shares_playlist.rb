equire 'spec_helper'

describe "user can share playlist" do
  let(:user) do 
    User.create!({
      email: "j@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Jeff",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

   let(:user2) do 
    User.create!({
      email: "t@k.co",
      password: "Tai",
      password_confirmation: "Tai",
      first_name: "Tai",
      last_name: "A",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:kesha) do
    Artist.create!({
      name: "Ke$ha",
      photo_url: "http://placekitten.com/g/200/200"
    })
  end

  let(:tick_tock) do
    Song.create!({
      title: "Tick Tock",
      price: 1.99,
      artist: kesha
    })
  end

  let(:love_is_my_drug) do
    Song.create!({
      title: "Love is My Drug",
      price: 0.99,
      artist: kesha
    })
  end

  before do
    user.purchase(tick_tock)
    user.purchase(love_is_my_drug)
  end

  it "shares playlist" do
    # Setup
    login(user)

    # Workflow for feature
    visit user_path(user)
    click_link "Create Playlist"
    visit new_user_playlist_path(user)
    fill_in "Title", with: "Sweet Beats"
    select tick_tock.title, from: "playlist_songs"
    select user2.first_name, from: "users"
    click_button "Create"

  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end
end