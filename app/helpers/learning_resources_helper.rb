module LearningResourcesHelper
  def video_code(learning_resource)
    "https://www.youtube.com/embed/" << learning_resource.link.split("=")[1]
  end
end
