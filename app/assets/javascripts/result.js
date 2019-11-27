document.addEventListener("turbolinks:load", function () {
  $('.post-result').on('click', function () {
    var id = $(this).data('id')
    var url = `/bettings/${id}/result`
    var result = $(this).siblings().val()
    if (result == "") {
      alert('数値を入力してください')
    } else {
      $.ajax({
        url: url,
        type: "get",
        data: { result: result },
      })
        .done(function () {
          location.reload()
        })
        .fail(function () {
          window.alert('正しい結果を得られませんでした。');
        });
    }
  })
  $('.edit-result').on('click', function () {
    $(this).parent().siblings().removeClass('d-none')
    $(this).remove()
  })
})