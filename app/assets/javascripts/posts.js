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
      buildHTML(data);
    })
  })
  .fail(function() {
    window.alert('正しい結果を得られませんでした。');
  });
  function buildHTML(data){
    html_count = `<h1 class='pl-3'>
    ${data.name}(${data.year})掲示板/投稿数(${data.count}件)
    </h1>`
    $('#post_count').empty();
    $('#post_count').prepend(html_count);
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
    $('#post_prediction').val('');
    $('#post_body').val('');
  }
})