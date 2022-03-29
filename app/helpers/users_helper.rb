module UsersHelper

    def avatar(user, size: 250)
        image_tag user.avatar.variant(auto_orient: true, rotate: 0, resize: "#{size}x#{size}^", crop: "#{size}x#{size}+0+0"), class: 'user-avatar avatar'  if user.avatar.attached?
    end
end

