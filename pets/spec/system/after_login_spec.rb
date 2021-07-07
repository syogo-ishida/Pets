require 'rails_helper'

describe 'ユーザーログイン後のテスト' do
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'LOG IN'
  end

  describe 'ヘッダーのテスト：ログインしている場合' do
    context '表示内容の確認' do
      it 'MY PAGEリンクが表示される：左上から１番目のリンクがマイページである' do
        mypage_link = find_all('a')[1].native.inner_text
        expect(mypage_link).to match(/マイページ/i)
      end
      it 'YOUR DOGSリンクが表示される：左上から２番目のリンクがマイペットである' do
        your_dogs_link = find_all('a')[2].native.inner_text
        expect(your_dogs_link).to match(/マイペット/i)
      end
      it 'RANKINGリンクが表示される：左上から３番目のリンクがランキングである' do
        ranking_link = find_all('a')[3].native.inner_text
        expect(ranking_link).to match(/ランキング/i)
      end
      it 'LOG OUTリンクが表示される：左上から４番目のリンクがログアウトである' do
        logout_link = find_all('a')[4].native.inner_text
        expect(logout_link).to match(/ログアウト/i)
      end
    end

    context 'リンク内容を確認(LOG OUTは”ユーザーログアウトのテスト”でテスト済み)' do
      subject { current_path }

      it 'ロゴを押すとトップ画面に遷移する' do
        click_link 'navbar-content-center'
        is_expected.to eq '/'
      end
      it 'MY PAGEを押すとマイページ画面に遷移する' do
        click_link 'nav-link3'
        is_expected.to eq '/users/' + user.id.to_s # '/users/n'
      end
      it 'YOUR DOGSを押すとみんなの投稿画面に遷移する' do
        click_link 'nav-link4'
        is_expected.to eq '/homes/about'
      end
      it 'RANKINGを押すとランキング画面に遷移する' do
        click_link 'nav-link5'
        is_expected.to eq '/posts/ranking'
      end
      it '設定アイコンを押すとユーザー情報編集画面に遷移する' do
        click_link 'nav-link7'
        is_expected.to eq '/users/' + user.id.to_s + '/edit' # 'users/n/edit'
      end
    end
  end

  describe 'ユーザーログアウトのテスト' do
    before do
      click_link 'nav-link6'
    end

    context 'ログアウト機能のテスト' do
      subject { current_path }

      it 'LOG OUTを押すとトップ画面に遷移する' do
        is_expected.to eq '/'
      end
    end
  end
end
