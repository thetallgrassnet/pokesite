require 'rails_helper'

RSpec.describe Article::PostsController, type: :controller do

  describe "GET #index" do
    let!(:posts) { FactoryBot.create_list(:article_post, 20, :published) }
    subject      { get :index }

    it { is_expected.to have_http_status :success }
  end

  describe "GET #show" do
    subject { get :show, params: { id: post.slug } }

    context 'with a published post' do
      let!(:post) { FactoryBot.create(:article_post, :published) }
      it          { is_expected.to have_http_status :success }
    end

    context 'with an unpublished post' do
      let!(:post) { FactoryBot.create(:article_post) }
      it          { expect { subject }.to raise_error ActiveRecord::RecordNotFound }
    end

    context 'with a future published post' do
      let!(:post) { FactoryBot.create(:article_post, :future_published) }
      it          { expect { subject }.to raise_error ActiveRecord::RecordNotFound }
    end
  end

end
