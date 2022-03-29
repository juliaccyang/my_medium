module StoriesHelper
    def cover(story, length: 1000, width: 800)
        image_tag story.cover_image.variant(auto_orient: true, rotate: 0, resize: "#{length}x#{width}^", crop: "#{length}x#{width}+0+0"), class: 'cover-image'  if story.cover_image.attached?
    end
end
