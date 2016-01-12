#= require_self
#= require_tree .

window.OuiShare =
  initPage: ->
    # If you're using the Turbolinks and you need run a code only one time, put something here.
    # if you're not using the turbolinks, there's no difference between init and initPage.

  init: ->
    # Something here. This is called in every page, with or without Turbolinks.


$(document).ready ->

  if $('#slider1_container').length > 0
    jssor_slider1_starter(slider1_container)

  if $('#slider2_container').length > 0
    jssor_slider2_starter(slider2_container)

  if $('#slider3_container').length > 0
    jssor_slider3_starter(slider3_container)

  $('.eur').click (e) ->
    e.preventDefault()
    $('.eur').addClass('active')
    $('.usd').removeClass('active')
    $('.dolar').hide()
    $('.euro').show()

  $('.usd').click (e) ->
    e.preventDefault()
    $('.eur').removeClass('active')
    $('.usd').addClass('active')
    $('.euro').hide()
    $('.dolar').show()

  $('.add-contact-language').click (e) ->
    e.preventDefault()
    value = $('.contact-language-select').val()
    res = $('#user_contact_languages').val().replace('{','').replace('}','').split(',')
    if (res.indexOf(value) == -1)
      console.log res
      res.push(value)
      console.log res 
      $('#user_contact_languages').val("{"+res.toString()+"}")
      $('.contact-languages').append("<div value='"+value+"' class='contact-language-value'><span class='remove-contact-language'>x</span>" +value+ "</div>")

  $('#edit').on 'click', '.remove-contact-language', (e) ->
    value = this.parentNode.getAttribute('value')
    res = $('#user_contact_languages').val().replace('{','').replace('}','').split(',')
    res = res.splice(res, res.indexOf(value))
    $('#user_contact_languages').val("{"+res.toString()+"}")
    this.parentNode.remove()

  # tag system for events on community page
  $('.community_events').hide()
  res_community = []
  $('#community_event_ids option:selected').each (i, selected)->
    res_community[i] = $(selected).text()
  $('#event_community').click (e) ->
    e.preventDefault()
    value = $('#event_community option:selected').text()
    id = $('#event_community option:selected').val()
    if (res_community.indexOf(value) == -1)
      res_community.push(value)
      $('#community_event_ids option[value="'+id+'"]').prop('selected', true)
      $('.event_community').append("<div class='event-community-value' id='event-"+id+"'><span class='remove-event-community'>x</span>" +value+ "</div>")
  
  $('.event_community').on 'click', '.remove-event-community', (e) ->
    value = this.parentNode.getAttribute('id')
    id = value.split('-')[1]
    $('#community_event_ids option[value="'+id+'"]').prop('selected', false)
    $('#'+value+'').remove()

  # tag system for users on community page
  $('.community_users').hide()
  user_community = []
  $('#community_user_ids option:selected').each (i, selected)->
    user_community[i] = $(selected).text()
  $('#users_community').click (e) ->
    e.preventDefault()
    value = $('#users_community option:selected').text()
    id = $('#users_community option:selected').val()
    if (user_community.indexOf(value) == -1)
      user_community.push(value)
      $('#community_user_ids option[value="'+id+'"]').prop('selected', true)
      $('.user_community').append("<div class='user-community-value' id='user-"+id+"'><span class='remove-user-community'>x</span>" +value+ "</div>")
  
  $('.user_community').on 'click', '.remove-user-community', (e) ->
    value = this.parentNode.getAttribute('id')
    id = value.split('-')[1]
    $('#community_user_ids option[value="'+id+'"]').prop('selected', false)
    $('#'+value+'').remove()

  # tag system for users on event page
  $('.event_users').hide()
  user_event = []
  $('#event_user_ids option:selected').each (i, selected)->
    user_event[i] = $(selected).text()
  $('#users_event').click (e) ->
    e.preventDefault()
    value = $('#users_event option:selected').text()
    id = $('#users_event option:selected').val()
    if (user_event.indexOf(value) == -1)
      user_event.push(value)
      $('#event_user_ids option[value="'+id+'"]').prop('selected', true)
      $('.user_event').append("<div class='user-event-value' id='user-"+id+"'><span class='remove-user-event'>x</span>" +value+ "</div>")
  
  $('.user_event').on 'click', '.remove-user-event', (e) ->
    value = this.parentNode.getAttribute('id')
    id = value.split('-')[1]
    $('#event_user_ids option[value="'+id+'"]').prop('selected', false)
    $('#'+value+'').remove()

  # tag system for users on project page
  $('.project_users').hide()
  user_project = []
  $('#project_user_ids option:selected').each (i, selected)->
    user_project[i] = $(selected).text()
  $('#users_project').click (e) ->
    e.preventDefault()
    value = $('#users_project option:selected').text()
    id = $('#users_project option:selected').val()
    if (user_project.indexOf(value) == -1)
      user_project.push(value)
      $('#project_user_ids option[value="'+id+'"]').prop('selected', true)
      $('.user_project').append("<div class='user-project-value' id='user-"+id+"'><span class='remove-user-project'>x</span>" +value+ "</div>")
  
  $('.user_project').on 'click', '.remove-user-project', (e) ->
    value = this.parentNode.getAttribute('id')
    id = value.split('-')[1]
    $('#project_user_ids option[value="'+id+'"]').prop('selected', false)
    $('#'+value+'').remove()

  # tag system for users on expert_group page
  $('.expert_group_users').hide()
  user_expert_group = []
  $('#expert_group_user_ids option:selected').each (i, selected)->
    user_expert_group[i] = $(selected).text()
  $('#users_expert_group').click (e) ->
    e.preventDefault()
    value = $('#users_expert_group option:selected').text()
    id = $('#users_expert_group option:selected').val()
    if (user_expert_group.indexOf(value) == -1)
      user_expert_group.push(value)
      $('#expert_group_user_ids option[value="'+id+'"]').prop('selected', true)
      $('.user_expert_group').append("<div class='user-expertgroup-value' id='user-"+id+"'><span class='remove-user-expertgroup'>x</span>" +value+ "</div>")
  
  $('.user_expert_group').on 'click', '.remove-user-expertgroup', (e) ->
    value = this.parentNode.getAttribute('id')
    id = value.split('-')[1]
    $('#expert_group_user_ids option[value="'+id+'"]').prop('selected', false)
    $('#'+value+'').remove()

  remove_ctc_lang = (t) ->
    console.log(this)

  removetest = (t) ->
    console.log(test)
  

remove_ctc_lang = () ->
  console.log(this)

removetest = (t) ->
  console.log(test)

jssor_slider1_starter = (containerId) ->
  options = 
    $AutoPlay: false
    $PauseOnHover: 1
    $ArrowKeyNavigation: true
    $SlideWidth: 600
    $SlideSpacing: 0
    $DisplayPieces: 2
    $ParkingPosition: 300
    $ArrowNavigatorOptions:
      $Class: $JssorArrowNavigator$
      $ChanceToShow: 2
      $AutoCenter: 2
      $Steps: 1
    
  jssor_slider1 = new $JssorSlider$(containerId, options)
  #responsive code begin
  #you can remove responsive code if you don't want the slider scales while window resizes

  ScaleSlider = ->
    parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth
    if parentWidth
      jssor_slider1.$ScaleWidth(Math.min(parentWidth))
    else
      $Jssor$.$Delay ScaleSlider, 30
    return

  ScaleSlider()
  $Jssor$.$AddEvent window, 'load', ScaleSlider
  $Jssor$.$AddEvent window, 'resize', ScaleSlider
  $Jssor$.$AddEvent window, 'orientationchange', ScaleSlider
  #responsive code end
  return

jssor_slider2_starter = (containerId) ->
  options = 
    $AutoPlay: false
    $PauseOnHover: 1
    $ArrowKeyNavigation: true
    $SlideWidth: 400
    $SlideSpacing: 0
    $DisplayPieces: 3
    $ParkingPosition: 0
    $ArrowNavigatorOptions:
      $Class: $JssorArrowNavigator$
      $ChanceToShow: 2
      $AutoCenter: 2
      $Steps: 1
    
  jssor_slider2 = new $JssorSlider$(containerId, options)
  #responsive code begin
  #you can remove responsive code if you don't want the slider scales while window resizes

  ScaleSlider = ->
    parentWidth = jssor_slider2.$Elmt.parentNode.clientWidth
    if parentWidth
      jssor_slider2.$ScaleWidth(Math.min(parentWidth))
    else
      $Jssor$.$Delay ScaleSlider, 30
    return

  ScaleSlider()
  $Jssor$.$AddEvent window, 'load', ScaleSlider
  $Jssor$.$AddEvent window, 'resize', ScaleSlider
  $Jssor$.$AddEvent window, 'orientationchange', ScaleSlider
  #responsive code end
  return

jssor_slider3_starter = (containerId) ->
  options = 
    $AutoPlay: true
    $PauseOnHover: 1
    $ArrowKeyNavigation: true
    $SlideWidth: 400
    $SlideSpacing: 0
    $DisplayPieces: 3
    $ParkingPosition: 0
    $ArrowNavigatorOptions:
      $Class: $JssorArrowNavigator$
      $ChanceToShow: 2
      $AutoCenter: 2
      $Steps: 1
    
  jssor_slider2 = new $JssorSlider$(containerId, options)
  #responsive code begin
  #you can remove responsive code if you don't want the slider scales while window resizes

  ScaleSlider = ->
    parentWidth = jssor_slider2.$Elmt.parentNode.clientWidth
    if parentWidth
      jssor_slider2.$ScaleWidth(Math.min(parentWidth))
    else
      $Jssor$.$Delay ScaleSlider, 30
    return

  ScaleSlider()
  $Jssor$.$AddEvent window, 'load', ScaleSlider
  $Jssor$.$AddEvent window, 'resize', ScaleSlider
  $Jssor$.$AddEvent window, 'orientationchange', ScaleSlider
  #responsive code end
  return
