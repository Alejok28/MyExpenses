$(document).ready(function(){
  var category = '';
  var type = '';
  var month = '';
  $('#timer_start').on('change', function(){
    month = $(this).val();
    $.ajax({
      method: "GET",
      url: url_request(),
      dataType: 'script'
    });
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
  })
  function url_request(){
    return "/expenses/?utf8=✓&type_id=" + type + "&category_id=" + category + "&month=" + month;
  }

})
