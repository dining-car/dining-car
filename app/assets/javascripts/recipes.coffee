# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', ->

  read_url = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        $('#image-preview').attr 'src', e.target.result
        $('#image-preview').hide()
        $('#image-preview').fadeIn 650
        return

      reader.readAsDataURL input.files[0]
    return

  change_file_name = (input) ->
    if input.files and input.files[0]
      file_name_el = input.parentNode.parentNode;
      file_name_el.querySelector('.file-name').innerHTML= input.files[0].name;
      file_name_el.classList.remove('is-empty');
    return

  $('#image-upload').change ->
    read_url this
    change_file_name this
    return

  $('#toggle-filters').click ->

    $('#filters-box').toggleClass("is-hidden-touch")
    return

  return
