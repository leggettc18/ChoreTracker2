# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  (($) ->
    $('.tab ul.tabs').addClass('active').find('> li:eq(0)').addClass 'current'
    $('.tab ul.tabs li a').click (g) ->
      tab = $(this).closest('.tab')
      index = $(this).closest('li').index()
      tab.find('ul.tabs > li').removeClass 'current'
      $(this).closest('li').addClass 'current'
      tab.find('.tab_content').find('div.tabs_item').not('div.tabs_item:eq(' + index + ')').slideUp()
      tab.find('.tab_content').find('div.tabs_item:eq(' + index + ')').slideDown()
      # #alert($(this).closest('li').index())
      # if ($(this).closest('li').index() is 4 )
      #   alert((index))
      #   $('#calendar').fullCalendar 'render'
      # # initialize_calendar
      g.preventDefault()
      return
    
    return
  ) jQuery
  return