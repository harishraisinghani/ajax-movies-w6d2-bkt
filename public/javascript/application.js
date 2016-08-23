$(function() {

  var addMovie = function(movie, optimistic=false){

    // clone & append dummy to .movies
    $new_movie = $('.movie.dummy')
                  .clone()
                  .removeClass('dummy')
                  .appendTo('.movies');

    if(optimistic){
      $new_movie.addClass('optimistic');
    }

    // input fields 
    $new_movie.find('.poster_src').attr('src', movie.poster_src);
    $new_movie.find('.name').text(movie.name);
    $new_movie.find('.year').text(movie.year);
    $new_movie.find('.running_time').text(movie.running_time);
  }

  $('button.load-movies').on('click', function(e){

    // load movies via get
    // console.log("load movies");
    $('.spinner').show();
    $('.movie').not('.dummy').remove();

    $.ajax({
      method:   'GET',
      dataType: 'json',
      url:      '/api/movies'

    }).done(function(movies){//success
      console.log("Success");

      movies.forEach(function(movie){
        addMovie(movie);
      });

    }).fail(function(jqXHR, textStatus){
      console.log("Failed because: "+ jqXHR.textStatus);
      // debugger;
      //
    }).always(function(){
      console.log("Always");
      $('.spinner').hide();
    });


  });


  $('button.add-movie').on('click', function(){

    //show form
    $('.add-movie').show();

    console.log("add movie");
  });



  $('form.add-movie').on('submit', function(e){

    console.log("add movie");
    //prevent default form submit
    e.preventDefault();

    //set vars in json obj
    var name = $(this).find('#name').val();
    var year = $(this).find('#year').val();
    var poster_src = $(this).find('#poster_src').val();
    //validate?

    var new_movie = {name: name, year: year, poster_src: poster_src}

    addMovie(new_movie, true);

    //ajax post: method, data, url
    $.ajax({
      method: 'POST',
      data:   new_movie,
      dataType: 'json',
      url:    '/api/movie'

    }).done(function(status){//success
      console.log("Success on posting movie");

      debugger;
      if(status.success){
        $('.optimistic').removeClass('optimistic');
      }else {//unsuccessful
        $('.optimistic').remove();
      }


    }).fail(function(jqXHR, textStatus){
      console.log("Failed posting movie because: "+ jqXHR.textStatus);
      $('.optimistic').remove();
      //render some message about failed movie addition

      // debugger;
    }).always(function(){
      console.log("Always posted movie");
    });

    //optimistically load movie? retract if fail to submit

  });

});
