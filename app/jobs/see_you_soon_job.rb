class SeeYouSoonJob < ApplicationJob
  queue_as :default

  # Delete all records that are part of the paid feature.
  def perform(user)
    user.posts.each { |post| post.destroy }
    user.uploaded_pictures.each { |upload| upload.destroy }
  end
end
