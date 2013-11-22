$ ->
  $.ajax 
    url: '/api/users/'
    type: 'GET'
    data: 'json'
    success: (data) ->
      source = $("#users-template").html()
      template = Handlebars.compile source
      output = template(data)
      $('#page-content').html(output)

  $.ajax 
    url: '/api/users/3/props'
    type: 'GET'
    data: 'json'
    success: (data) ->
      source = $("#user-template").html()
      template = Handlebars.compile source
      output = template(data)
      console.log data 
      $('#professions-content').html(output)  
        
  # $('#page-content').on 'click', 'ul.profile-link li a', (e) ->
  #   e.preventDefault()
  #   $.ajax
  #     url: $(@).attr('href')
  #     type: 'GET'
  #     data: 'json'
  #     success: (data) ->
  #       source = $("#users-template").html()
  #       template = Handlebars.compile source
  #       $('#page-content').html template(data)
  #     error: (x,y,z) ->
  #       console.log x,y,z
