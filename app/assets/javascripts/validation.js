$(document).on('turbolinks:load', function() {
  $('.button').on('click', function(){
    if ($('#post_prediction').val() == '' || $('#post_body').val() == '' ){
      alert('入力してください')
      return false
    }
  })
})