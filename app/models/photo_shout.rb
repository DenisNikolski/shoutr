class PhotoShout < ApplicationRecord
  has_attached_file :image, styles: { thumb: '200x200' }

  validates_attachment :image,
                       content_type: { content_type: %w[image/jpeg image/git image/png] },
                       size:         { in: 0..15.megabytes }
end
