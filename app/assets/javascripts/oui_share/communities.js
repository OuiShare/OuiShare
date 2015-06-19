$(document).ready(function() {
  $('#country_select').change(function() {
    $.ajax({
      url: "/get_communities_select",
      data: {
        region_id : $('#country_select').val()
      },
      dataType: "json"
    }).done(function(result) {
      var comSelect = $('#community_select');
      comSelect.empty();
      for (var i = 0; i < result.length; i++) {
        comSelect.append(new Option(result[i][1], result[i][0]));
      }
      comSelect.change();
    });
  });
  $('#community_select').change(function() {
    $.ajax({
      url: "/get_community_partial",
      dataType: 'html',
      data: {community_id: $('#community_select').val()},
    })
    .done(function(result) {
      var textField = $('#communitypartial');
      textField.html(result); 
    });
  });
}); 