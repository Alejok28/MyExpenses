$(document).on('turbolinks:load',function(){

  var category = '';
  var type = '';
  var date = $('#timer_start').val();

  $('#timer_start').on('change', function(){
    date = $(this).val();
    $.ajax({
      method: "GET",
      url: url_request(),
      dataType: 'script'
    });
    history.pushState(null, '', url_request());
  })

  $('.filter-type .list-group-item').on('click', function(){
    $('.filter-type .list-group-item').removeClass('active');
    $(this).toggleClass('active');
    type = $(this).attr('id');
    $.ajax({
      method: "GET",
      url: url_request(),
      dataType: 'script'
    });

    history.pushState(null, '', url_request());
  })

  $('.filter-category .list-group-item').on('click', function(){
    $('.filter-category .list-group-item').removeClass('active');
    $(this).toggleClass('active');

     category = $(this).attr('id');
     $.ajax({
       method: "GET",
       url: url_request(),
       dataType: 'script'
     });
     history.pushState(null, '', url_request());
  })
  function url_request(){
    if (type == '' && category == '') {
      return "/expenses/?utf8=✓&date=" + date;
    }else if (type == '') {
      return "/expenses/?utf8=✓&category_id=" + category + "&date=" + date;
    }else if (category == '') {
      return "/expenses/?utf8=✓&type_id=" + type + "&date=" + date;
    }else {
      return "/expenses/?utf8=✓&type_id=" + type + "&category_id=" + category + "&date=" + date;
    }
  }
})
