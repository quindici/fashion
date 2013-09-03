fashion
=======

Fashion social network project

System Description:

Development Notes
- implemented User model authentication functionality with Devise
- implemented Avatar using paperclip (yet to define save path)
- implemented Bootstrap-scss for basic styling

TODO List (Sorted by priority):
- Writing About page
<group>
- Writing integration test coding to guarantee overall functionalities of the site
-- visiting static pages
-- user authentication
-- sign up checking
</group>

<group>
- Setup Look Model, with photos within Photo model
-- guarantee only owner users can edit, delete photos
-- How to prevent: A try to submit a look in behalf of B using edited "post" data (Controller)

- Setup Comments Model, belongs to User, for Look model
-- Comments including "Comment Text" and "Rating"
</group>

<group>
- connectivity to Facebook
-- ability to share look on Facebook
-- ability to invite others to visit your look, even if they are not sign-in
-- ability to invite others to comment (visited with hidden comment fields for non-signed-up users)
</group>

<group>
- Search functionality
-- Search user
-- Search look via description and tags and similarity of user
- Tagging: Implement Look tagging
</group>

<group>

</group>