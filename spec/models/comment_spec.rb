require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:test_movie) { Movie.new }
  let(:test_user) { User.create!(name: "Carlos", email: "Carlos@gmail.com", password: "password" ) }

  describe 'validations' do

    before(:each) do
      test_movie.get_movies_by_title("Fight Club")
      first_movie = Movie.first
      @new_comment = first_movie.comments.new(content: "This film was a work of art", user_id: test_user.id)
    end

    it 'saves a new comment if successfully created' do
      expect{@new_comment.save}.to change{Comment.count}.by(1)
    end

    it 'saves a new comment if content is present' do
      if @new_comment.content = !nil
        expect{@new_comment.save}.to change{Comment.count}.by(1)
      end
    end

    it 'saves a new comment if movie_id is present' do
      if @new_comment.movie_id = !nil
        expect{@new_comment.save}.to change{Comment.count}.by(1)
      end
    end

    it 'saves a new comment if user_id is present' do
      if @new_comment.user_id = !nil
        expect{@new_comment.save}.to change{Comment.count}.by(1)
      end
    end

    it 'does not add a comment to the database if they are not saved' do
      if !@new_comment.save
        expect{@new_comment.save}.to change{Comment.count}.by(0)
      end
    end

    it 'does not add a comment to the database if its content is NOT present' do
      if @new_comment.content = nil
        expect{@new_comment.save}.to change{Comment.count}.by(0)
      end
    end

    it 'does not add a comment to the database if its user id is NOT present' do
      if @new_comment.user_id = nil
        expect{@new_comment.save}.to change{Comment.count}.by(0)
      end
    end

    it 'does not add a comment to the database if its movie id is NOT present' do
      if @new_comment.movie_id = nil
        expect{@new_comment.save}.to change{Comment.count}.by(0)
      end
    end

  end

  describe 'relationships' do

    before(:example) do
      test_movie.get_movies_by_title("Fight Club")
      @first_movie = Movie.first
      @first_movie.comments.create(content: "This film was a masterpiece", user_id: test_user.id)
    end

    it 'a user has many comments' do
      expect(test_user.comments).to be_kind_of(ActiveRecord::Associations::CollectionProxy)
    end

    it 'a movie has many comments' do
      expect(@first_movie.comments).to be_kind_of(ActiveRecord::Associations::CollectionProxy)
    end

  end
end
