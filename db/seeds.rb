# User.create(first_name: "Nolan",
#             last_name: "Frazier",
#             profile_name: "nofrazier",
#             email: "frazier103@gmail.com",
#             password: "Osborne1988",
#             password_confirmation: "Osborne1988",
#             admin: true,
#             activated: true,
#             activated_at: Time.zone.now)

IntegrationType.create(name: "Accounting")
IntegrationType.create(name: "Analytics")
IntegrationType.create(name: "Bidding/Estimating")
IntegrationType.create(name: "CRM")
IntegrationType.create(name: "Insurance")
IntegrationType.create(name: "Other")
IntegrationType.create(name: "Scheduling")
IntegrationType.create(name: "Storage")
IntegrationType.create(name: "Custom Integrations")

LearningResourceType.create(name: "Article")
LearningResourceType.create(name: "Book")
LearningResourceType.create(name: "Podcast")
LearningResourceType.create(name: "Video")

LearningResource.create(title: "The Evolution of Sales Engineering", link: "https://www.linkedin.com/pulse/evolution-sales-engineering-organization-jonathan-michaels", learning_resource_type_id: 1, user_id: 1)
