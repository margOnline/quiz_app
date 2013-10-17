# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

startQuiz =  ->
  $('.start-quiz').hide()

  $('.timer').data('time-remaining', 15).text('15')

  setInterval ->

    time_remaining = $('.timer').data('time-remaining')
    if time_remaining > 0
      time_remaining -= 1    
      $('.timer').data('time-remaining', time_remaining)
      ('.timer').text(time_remaining)
    else
      $('.timer').data('time-remaining', 15).text('15')

      correct = $.grep window.results, (r) -> { r }
      percent = (correct.length / window.results.length) * 100
      alert(percent)
      $('.result').text(percent + '%')
      window.results = []
  ,1000

window.results=[]

dispatcher = new WebSocketRails 'localhost:3000/websocket'
channel = dispatcher.subscribe 'quizzes'
channel.bind 'new', (quiz) -> 
  $('body').prepend $('<h3>',{ text: quiz.title})

channel.bind 'start', (quiz) ->
  $('.question:first').addClass('active')
  startTimer()

answers_channel = dispather.cubscribe 'answers'
answers_channel.bind 'score', (score) ->
  window.results.push score.correct


$ ->
  $('.start-quiz').click ->
    channel.trigger 'start'

    
    $('.multiplayer button').click ->
      aid = $(this).data('id')
      qid = $(this).data('question-id')

      $('.question-active button').

      $.post('/multiplayer_attempts/check_answer', {id: aid, question_id: qid}, (response) -> 
        alert(response['response'])
        $('.question.active').removeClass('active').next().addClass('active'))

    stop_timer(time-remaining) ->


    how to make the different players start at the same time - use one button

storing all the results in a variable on the window, so as long as the window is opened, we can access that data from 
  window.foo = x


  clear the results
  and wait for timer to run out before going to next answer
