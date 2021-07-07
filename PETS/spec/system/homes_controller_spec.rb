require 'rails_helper'

describe 'ユーザーログイン後のテスト：homes_controller' do
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

  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
  end

  describe 'みんなの投稿画面のテスト' do
    before do
      visit about_path
    end

    context '表示内容の確認' do
    end

    context 'リンクを確認' do
    end

    context 'いいね機能の確認' do
    end
  end
end
