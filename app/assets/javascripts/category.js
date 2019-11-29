document.addEventListener("turbolinks:load", function () {
  $(document).on('change', '#bettings_category', function (e) {
    var category = $('#bettings_category option:selected').val();
    e.preventDefault
    $('.horse_number_1').empty()
    $('.horse_number_2').empty()
    $.ajax({
      url: '/bettings/category_children',
      type: 'GET',
      dataType: 'json',
      data: { category: category }
    })
      .done(function (children) {
        var selectAppendArea = $('.category_children')
        var selectID = 'bettings_category_id'
        selectAppendArea.empty()
        buildChildrenSelect(selectAppendArea, selectID)
        var optionApendArea = $('#bettings_category_id')
        children.forEach(function (child) {
          buildChildrenOption(child, optionApendArea)
        })
      })
      .fail(function () {
      })
  })
  $(document).on('change', '#bettings_category_id', function (e) {
    e.preventDefault
    var category = $('#bettings_category option:selected').text();
    var category_children = $('#bettings_category_id option:selected').text();
    $('.combination').empty();
    if (category == "馬単" && category_children == "通常") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbersPulldown()
      $('.horse_number_1').append('<p>一着</p>')
      $('.horse_number_1').append(html)
      $('.horse_number_1').children('select').addClass('checkbox')
      $('.horse_number_2').append('<p>二着</p>')
      $('.horse_number_2').append(html)
    } else if (category == "馬単" && category_children == "ボックス") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbers18()
      $('.horse_number_1').append(html)
    } else if (category == "馬単" && category_children == "1着ながし") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbersPulldown()
      $('.horse_number_1').append('<p>1着</p>')
      $('.horse_number_1').append(html)
      $('.horse_number_1').children('select').addClass('checkbox')
      buildHorseNumbers18()
      $('.horse_number_2').append('<p>2着</p>')
      $('.horse_number_2').append(html)
    } else if (category == "馬単" && category_children == "2着ながし") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbers18()
      $('.horse_number_1').append('<p>1着</p>')
      $('.horse_number_1').append(html)
      $('.horse_number_1').children('input').each(function () {
        $(this).addClass('checkbox')
      })
      buildHorseNumbersPulldown()
      $('.horse_number_2').append('<p>2着</p>')
      $('.horse_number_2').append(html)
    } else if (category == "枠連" && category_children == "ながし") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbersPulldown8()
      $('.horse_number_1').append(html)
      buildHorseNumbers8()
      $('.horse_number_2').append(html)
    } else if (category == "枠連" && category_children == "通常") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbersPulldown8()
      $('.horse_number_1').append(html)
      $('.horse_number_2').append(html)
    } else if (category == "枠連") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbers8()
      $('.horse_number_1').append(html)
    } else if ((category == "馬連" || category == "ワイド") && category_children == "ボックス") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbers18()
      $('.horse_number_1').append(html)
    } else if ((category == "馬連" || category == "ワイド") && category_children == "ながし") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbersPulldown()
      $('.horse_number_1').append(html)
      buildHorseNumbers18()
      $('.horse_number_2').append(html)
    } else if (category == "馬連" || category == "ワイド") {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbersPulldown()
      $('.horse_number_1').append(html)
      $('.horse_number_2').append(html)
    } else {
      $('.horse_number_1').empty()
      $('.horse_number_2').empty()
      buildHorseNumbersPulldown()
      $('.horse_number_1').append(html)
    }
  })
  $(document).on('click', 'input[type="checkbox"]', function (e) {
    e.preventDefault
    var category = $('#bettings_category option:selected').text();
    var category_children = $('#bettings_category_id option:selected').text();
    $('.combination').empty();
    if (category == "馬単" && category_children == "ボックス") {
      var count = $('.horse_number_1 :checked').length
      var combination = count * (count - 1)
      if (!combination == 0) {
        $('.combination').append(combination + '通り');
      }
    } else if (category == "馬単" && category_children == "1着ながし") {
      var count = $('.horse_number_2 :checked').length
      $('.combination').append(count + '通り');
    } else if (category == "馬単" && category_children == "2着ながし") {
      var count = $('.horse_number_1 :checked').length
      $('.combination').append(count + '通り');
    } else if ((category == "馬連" || category == "ワイド") && category_children == "ボックス") {
      var count = $('.horse_number_1 :checked').length
      var combination = (count * (count - 1)) / 2
      if (!combination == 0) {
        $('.combination').append(combination + '通り');
      }
    } else if ((category == "馬連" || category == "ワイド") && category_children == "ながし") {
      var count = $('.horse_number_2 :checked').length
      $('.combination').append(count + '通り');
    } else if (category == "枠連" && category_children == "ボックス") {
      var count = $('.horse_number_1 :checked').length
      var combination = (count * (count - 1)) / 2
      if (!combination == 0) {
        $('.combination').append(combination + '通り');
      }
    } else if (category == "枠連" && category_children == "ながし") {
      var count = $('.horse_number_2 :checked').length
      $('.combination').append(count + '通り');
    }
  })
  function buildChildrenSelect(selectAppendArea, selectID) {
    childrenSelect = `<div class='category pt-3'>
                        <select class="select-box" name="bettings[category_id]" id="${selectID}">
                        <option value="">---</option>
                        </select>
                      </div>`
    selectAppendArea.append(childrenSelect);
  }
  function buildChildrenOption(child, optionApendArea) {
    childrenOption = `<option value="${child.id}">${child.name}</option>`
    optionApendArea.append(childrenOption);
  }
  function buildHorseNumbers8() {
    html = `<input type="checkbox" value="1" name="bettings[horse_number][]" id="bettings_horse_number_1" />1番
            <input type="checkbox" value="2" name="bettings[horse_number][]" id="bettings_horse_number_2" />2番
            <input type="checkbox" value="3" name="bettings[horse_number][]" id="bettings_horse_number_3" />3番
            <input type="checkbox" value="4" name="bettings[horse_number][]" id="bettings_horse_number_4" />4番
            <input type="checkbox" value="5" name="bettings[horse_number][]" id="bettings_horse_number_5" />5番
            <input type="checkbox" value="6" name="bettings[horse_number][]" id="bettings_horse_number_6" />6番
            <input type="checkbox" value="7" name="bettings[horse_number][]" id="bettings_horse_number_7" />7番
            <input type="checkbox" value="8" name="bettings[horse_number][]" id="bettings_horse_number_8" />8番`
    return html
  }
  function buildHorseNumbers18() {
    html = `<input type="checkbox" value="1" name="bettings[horse_number][]" id="bettings_horse_number_1" />1番
            <input type="checkbox" value="2" name="bettings[horse_number][]" id="bettings_horse_number_2" />2番
            <input type="checkbox" value="3" name="bettings[horse_number][]" id="bettings_horse_number_3" />3番
            <input type="checkbox" value="4" name="bettings[horse_number][]" id="bettings_horse_number_4" />4番
            <input type="checkbox" value="5" name="bettings[horse_number][]" id="bettings_horse_number_5" />5番
            <input type="checkbox" value="6" name="bettings[horse_number][]" id="bettings_horse_number_6" />6番
            <input type="checkbox" value="7" name="bettings[horse_number][]" id="bettings_horse_number_7" />7番
            <input type="checkbox" value="8" name="bettings[horse_number][]" id="bettings_horse_number_8" />8番
            <input type="checkbox" value="9" name="bettings[horse_number][]" id="bettings_horse_number_9" />9番
            <input type="checkbox" value="10" name="bettings[horse_number][]" id="bettings_horse_number_10" />10番
            <input type="checkbox" value="11" name="bettings[horse_number][]" id="bettings_horse_number_11" />11番
            <input type="checkbox" value="12" name="bettings[horse_number][]" id="bettings_horse_number_12" />12番
            <input type="checkbox" value="13" name="bettings[horse_number][]" id="bettings_horse_number_13" />13番
            <input type="checkbox" value="14" name="bettings[horse_number][]" id="bettings_horse_number_14" />14番
            <input type="checkbox" value="15" name="bettings[horse_number][]" id="bettings_horse_number_15" />15番
            <input type="checkbox" value="16" name="bettings[horse_number][]" id="bettings_horse_number_16" />16番
            <input type="checkbox" value="17" name="bettings[horse_number][]" id="bettings_horse_number_17" />17番
            <input type="checkbox" value="18" name="bettings[horse_number][]" id="bettings_horse_number_18" />18番`
    return html
  }
  function buildHorseNumbersPulldown() {
    html = `<select name="bettings[horse_number][]" class="select-box" id="bettings_horse_number">
              <option value="">馬番</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option>
              <option value="16">16</option>
              <option value="17">17</option>
              <option value="18">18</option>
            </select>`
    return html
  }
  function buildHorseNumbersPulldown8() {
    html = `<select name="bettings[horse_number][]" id="bettings_horse_number">
              <option value="">馬番</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
            </select>`
    return html
  }
  $(document).on("change", ".checkbox", function () {
    checked = $(this).val()
    $('.horse_number_2').children('select').children('option').each(function () {
      if ($(this).val() == checked) {
        $(this).prop("disabled", true)
        $(this).addClass('d-none')
      } else {
        $(this).prop("disabled", false)
        $(this).removeClass('d-none')
      }
    })
  });
  $('form').on('submit', function (e) {
    e.preventDefault()
    var category_children = $('#bettings_category_id option:selected').text();
    if (category_children != "通常") {
      var investment = $('#bettings_investment').val()
      var combination = $('.combination').text().replace(/[^0-9]/g, '')
      $('#bettings_investment').val(investment * combination)
    }
    this.submit()
  })
})