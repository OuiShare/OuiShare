OuiShare.Admin ?= {}
OuiShare.Admin.Services ?= {}

OuiShare.Admin.Services.Index =
  init: ->
    $('.services').sortable
      axis: "y"
      placeholder: "sortable-highlight"
      items: '.sortable'
      start: (e, ui) ->
        ui.placeholder.height ui.item.height()

      stop: (e, ui) ->
        ui.item.effect "highlight", {}, 1000

      update: (e, ui) ->
        csrfToken = undefined
        position = undefined
        position = $('.services').find('.sortable').index(ui.item)
        csrfToken = $("meta[name='csrf-token']").attr("content")
        $.ajax
          type: "POST"
          url: ui.item.data("update-path")
          dataType: "json"
          headers:
            "X-CSRF-Token": csrfToken

          data:
            service:
              row_order_position: position
