Schemas.UserProfile = new SimpleSchema(

  picture:
    type: String
    optional:true
    label: 'Profile picture'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProfilePictures'

  name:
    type: String
    optional: true
	label:  ->
		TAPi18n.__ 'name'
)

Schemas.User = new SimpleSchema(

  username:
    type: String
    regEx: /^[a-z0-9A-Z_]{3,15}$/
    optional: true

  
  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

  createdAt:
    type: Date

  profile:
    type: Schemas.UserProfile
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    blackbox: true
    optional: true
)

Meteor.users.attachSchema Schemas.User

# Export schemas
@StarterSchemas = Schemas
