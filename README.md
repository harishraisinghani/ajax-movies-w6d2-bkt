Movies Ajax loader. 
===================

Brought to you by Lighthouse Labs

## Getting Started
1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser

## Demoing AJAX

__ GET MOVIES FROM DB __
1) Edit ajax-movies.erb to create movie dummy layout
2) Edit application.js to make ajax call for all movies
3) Clone dummy & populate template to add data

__ ADD MOVIE TO DB __
1) Add form to html
2) Add js to read from form 
    -optimistically place element
3) Send ajax post req. 
4) Edit actions.rb to enable posting to db
5) Handle failure by hiding optimistic element

