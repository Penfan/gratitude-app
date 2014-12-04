Gratitude App
======================================
- Team Members: Jessica Chang, William Huang, Matthew Leong
- Demo Link: http://gratitudeapp.herokuapp.com

### Idea
An application where users can write and share posts of thanksgiving with their family, friends, etc.

### Models and Description
- User
has name, email, other various fields, and many thanks and groups

- Thanks
have text and belong to a User

- Group
contains its own name and has a many-to-many relationship with Users

### Features
- Users can log in
- Users can write Thanks
- Users can share Thanks with specific people or Groups

### Division of Labor:
- Jessica: UI, controller tests
- Will: models, controllers
- Matt: idea, scaffold, screencast, model tests
