require 'rails_helper'

describe 'ユーザーログイン後のテスト：posts_controller' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'LOG IN'
  end

  describe '投稿詳細画面のテスト' do
    before do
      visit post_path(post)
    end

    context '表示内容の確認' do
    end
  end


  describe '投稿編集画面のテスト' do
    before do
      visit edit_post_path(post)
    end

    context '表示内容の確認' do
    end
  end


  describe 'ランキング画面のテスト' do
    before do
      visit ranking_path
    end

    context '表示内容の確認' do
    end
  end


  # describe 'ハッシュタグ画面のテスト' do
  #   before do
  #     visit hashtag_path(hashname)
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/posts/' + post.id.to_s + '/edit'
  #     end
  #     it 'Post editと表示される' do
  #       expect(page).to have_content 'Post edit'
  #     end
  #   end
  # end




end