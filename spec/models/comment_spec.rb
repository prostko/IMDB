require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:new_comment) {Comment.new(content: "This film was a work of art", movie_id: 1, user_id: 1)}

  describe 'validations' do
    it 'saves a new comment if successfully created' do
      expect{new_comment.save}.to change{Comment.count}.by(1)
    end

    it 'saves a new comment if content is present' do
      if new_comment.content = !nil
        expect{new_comment.save}.to change{Comment.count}.by(1)
      end
    end

    it 'saves a new comment if movie_id is present' do
      if new_comment.movie_id = !nil
        expect{new_comment.save}.to change{Comment.count}.by(1)
      end
    end

    it 'saves a new comment if user_id is present' do
      if new_comment.user_id = !nil
        expect{new_comment.save}.to change{Comment.count}.by(1)
      end
    end

    it 'does not add a comment to the database if they are not saved' do
      if !new_comment.save
        expect{new_comment.save}.to change{Comment.count}.by(0)
      end
    end

    it 'does not add a comment to the database if its content is NOT present' do
      if new_comment.content = nil
        expect{new_comment.save}.to change{Comment.count}.by(0)
      end
    end

    it 'does not add a comment to the database if its user id is NOT present' do
      if new_comment.user_id = nil
        expect{new_comment.save}.to change{Comment.count}.by(0)
      end
    end

    it 'does not add a comment to the database if its movie id is NOT present' do
      if new_comment.movie_id = nil
        expect{new_comment.save}.to change{Comment.count}.by(0)
      end
    end

  end
end
