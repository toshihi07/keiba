$(function() {
  $('#new_post').on('submit', function(e){
    e.preventDefault();
    console.log(this);
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log('a')
      buildHTML(data);
    })
  })
  function buildHTML(data){
    html = `<div class='post-index__user-data'>
              ${data.nickname}
            </div>
            <div class='post-index__prediction'>
              ${data.prediction}
            </div>
            <div class='post-index__body'>
              ${data.body}
            </div>
            <div class='post-index__footer border-bottom'>
              いいね 返信 通報
            </div>`
    $('.post-index').prepend(html);
  }
})