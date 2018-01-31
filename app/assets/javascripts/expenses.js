$(document).on('turbolinks:load',function(){
  var category = '';
  var type = '';
  var date = '';
  $('#timer_start').on('change', function(){
    date = $(this).val();
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
    return "/expenses/?utf8=✓&type_id=" + type + "&category_id=" + category + "&date=" + date;
  }

  $('form#new_expense').on('submit',function(e){
    e.preventDefault();
    var concept = $('input#expense_concept').val();
    if (concept == '') {
      $('input#expense_concept').next('p').text('Concept cant be blank');
      $('input#expense_concept').parent('div').addClass('has-error');
    }
  })

})
