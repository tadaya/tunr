require 'spec_helper'

describe Connection do
  it { should validate_presence_of(:user) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:playlist) }
  it { should belong_to(:playlist) }

  
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

  let(:some_other_user) do
    User.create!({
      email: "k@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "PJ",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:user3) do
    User.create!({
      email: "k@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Tai",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:playlist) { Playlist.create!(title: "Sweet Beats", user: user)}
  let(:connection) { Connection.create!(playlist: playlist, user: user3)}

  it "should share playlist with users in which there is a connection" do
    expect(user3.playlists).to include(playlist)
    expect(some_other_user.playlists).to_not include(playlist)
  end
end