$(document).ready ->
  $('.tagsinput').tagsInput
      'autocomplete_url': '/autocomplete_tags'
      defaultText: '+ Tag'
      height: 'auto'
      width: 'auto'
      delimiter: ';'
