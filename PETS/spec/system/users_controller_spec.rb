require 'rails_helper'

describe 'ユーザーログイン後のテスト：users_controller' do
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

  describe '自分のマイページ画面のテスト' do
    before do
      visit user_path(user)
    end

    context '表示内容の確認' do
    end
  end

  describe '他人のマイページ画面のテスト(自分のマイページと表示が異なる箇所のみテストする)' do
    before do
      visit user_path(other_user)
    end

    context '表示内容の確認' do
    end
  end

  describe 'ユーザー情報編集画面のテスト' do
    before do
      visit edit_user_path(user)
    end

    context '表示内容の確認' do
    end

    context 'リンク内容を確認' do
      subject { current_path }
    end
  end

  describe 'マイページ情報編集画面のテスト' do
    before do
      visit edit_mypage_path(user)
    end

    context '表示内容の確認' do
    end
  end

  describe '退会画面のテスト' do
    before do
      visit unsubscribe_path(user)
    end

    context '表示内容の確認' do
    end
  end

  describe 'フォロー画面のテスト' do
    before do
      visit follows_user_path(user)
    end

    context '表示内容の確認' do
    end
  end

  describe 'フォロワー画面のテスト' do
    before do
      visit followers_user_path(user)
    end

    context '表示内容の確認' do
    end
  end


  describe 'お気に入り画面のテスト' do
    before do
      visit my_favorites_path(user)
    end

    context '表示内容の確認' do
    end
  end
end
