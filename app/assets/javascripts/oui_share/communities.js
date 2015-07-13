$(document).ready(function() {

  $('#country_select_region_id').change(function() {
    
    $.ajax({
      url: "/get_communities_select",
      data: {
        region_id : $('#country_select_region_id').val()
      },
      dataType: "json"
    }).done(function(result) {

      console.log('cities updated');
      console.log(result);
      var comSelect = $('#community_select_community_id');
      comSelect.empty();
      comSelect.append(new Option("Select a community", "0"));
      for (var i = 0; i < result.length; i++) {
        comSelect.append(new Option(result[i][1], result[i][0]));
      } 
      comSelect.change();
    });

    $.ajax({
      url: "/get_communities_partial",
      dataType: 'html',
      data: {region_id_2 : $('#country_select_region_id').val()},
    })
    .done(function(result2) {
      // console.log(result2);
      var textField = $('#communitypartial');
      textField.html(result2); 
    });

  });

  $('#community_select_community_id').change(function() {
    $.ajax({
      url: "/get_community_partial",
      dataType: 'html',
      data: {community_id: $('#community_select_community_id').val()},
    })
    .done(function(result) {
      var textField = $('#communitypartial');
      textField.html(result); 
    });
  });
}); 