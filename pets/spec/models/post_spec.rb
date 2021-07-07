require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'imageカラム' do
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'PostHashtagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_hashtags).macro).to eq :has_many
      end
    end
    context 'Hashtagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:hashtags).macro).to eq :has_many
      end
    end
  end
end