class Movie < ActiveRecord::Base
  mount_uploader :poster, PosterUploader
end
