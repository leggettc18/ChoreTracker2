# $('#menu-toggle,#menu-overlay').click ->
#   $('body').toggleClass 'open-menu'
#   return
# $('#main-nav li a').click ->
#   $('#main-nav li').removeClass 'active'
#   $(this).parent().addClass 'active'
#   return
# $(document).ready ->
#   $('.main div').hide()
#   $('.slidebar li:first').attr 'id', 'active'
#   $('.main div:first').fadeIn()
#   $('.slidebar a').click (e) ->
#     e.preventDefault()
#     if $(this).closest('li').attr('id') == 'active'
#       return
#     else
#       $('.main div').hide()
#       $('.slidebar li').attr 'id', ''
#       $(this).parent().attr 'id', 'active'
#       $('#' + $(this).attr('name')).fadeIn()
#     return
#   return
