###
  [Master JavaScript file]

  Project:	Zollo Landing page
  Version:	1.0
  Last change:	16/02/15
  Author:	Fantonica team
  Primary use:	Marketing sites

  Used plugins:
    jQuery "http://jquery.com/"
    Bootstrap "http://getbootstrap.com/"
    scrollReveal.js "http://scrollrevealjs.org/"
    Baguettebox.js "http://feimosi.github.io/baguetteBox.js/"
    SlickSlider.js "http://kenwheeler.github.io/slick/"
###

###
  Fix bug in IE9 with requestAnimationFrame
###

"use strict";

if !window.requestAnimationFrame

  window.requestAnimationFrame = (callback, element) ->
    currTime = (new Date).getTime()
    timeToCall = Math.max(0, 16 - (currTime - lastTime))
    id = window.setTimeout((->
      callback currTime + timeToCall
      return
    ), timeToCall)
    lastTime = currTime + timeToCall
    id

mapInit = ()->
  ### Initialize google map ###
  map = null
  location = new google.maps.LatLng 40.6743890, -73.9455

  styles = [
    featureType: "all",
    elementType: "all",
    stylers: [
      saturation: -100
    ]
  ]

  mapOptions =
    zoom: 11,
    center: location
    scrollwheel: off
    mapTypeControlOptions:
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'fantonica']

  map = new google.maps.Map(document.getElementById("map"), mapOptions);

  mapType = new google.maps.StyledMapType(styles,  name: "Grayscale" )

  marker = new google.maps.Marker
    position: new google.maps.LatLng(40.6743890, -73.9455),
    map: map,
    title: 'Some marker'

  map.mapTypes.set('fantonica', mapType)
  map.setMapTypeId('fantonica')


openMobileMenu = ()->
  ### Initialize mabile menu ###
  $('.open-mobile-menu').on 'click', (e)->
    e.stopPropagation();
    if $('.nav').hasClass('menu-opened')
      $('.nav').removeClass 'menu-opened'
    else
      $('.nav').addClass 'menu-opened'

      $(document).one 'click', ()->
        $('.nav').removeClass 'menu-opened'

$.fn.smoothMenu = ()->
  ### Initialize smooth scroll navigation ###
  self = @

  @on "click", (e)->
    e.preventDefault();

    target = $(@getAttribute('href'))

    if target.length
      $('body, html').animate
        scrollTop: target.offset().top
      , 1000

  sections = $('.section, .sub-section, .header, .container')

  updateActive = ()->

    for section in sections

      if window.scrollY > section.offsetTop - 100 and window.scrollY < (section.offsetTop + section.clientHeight)
        nav = self.filter(".nav [href='##{section.id}']")
        nav.addClass('active').parent().siblings().find('a').removeClass('active') if !nav.hasClass('active')

    requestAnimationFrame(updateActive)

  do updateActive

mailChimp = ()->
  $('.subscribe').each (form)->
    if action = $(form).attr('action')
      $(form).ajaxChimp
        url: action
        callback: (res)->
          $(form).find '.alert'
            .removeClass 'alert-success alert-danger'
          if res.result is "success"
            $(form).find '.alert'
              .html res.msg
              .addClass 'alert-success'
          if res.result is "error"
            $(form).find '.alert'
              .html res.msg
              .addClass 'alert-danger'

contactForm = ()->
  $('.contacts').on 'submit', (e)->
    e.preventDefault();

    $.ajax
      type: "post"
      url: "sendmail.php"
      data: $(@).serializeArray()
      success: (data)=>
        $(@).find('.alerts-wrap').append('<div class="alert alert-success alert-dismissible">
                    <button type="button" data-dismiss="alert" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                    <p>Message sent successfully</p>
                  </div>')

headerHeight = ()->

  height = $('.top-bar').height()

  $('.header-section').css
    paddingTop: $('.top-bar').height()

  if window.scrollY > height then $('.top-bar').addClass('waypoint') else $('.top-bar').removeClass('waypoint')

  requestAnimationFrame(headerHeight)

init = ()->
  ### Initialize all plugins after window load ###
  $('.site-wrapper').addClass('in');
#  mapInit()
  openMobileMenu()
  headerHeight()
  mailChimp()
  contactForm()

  $('[data-countdown]').each ->
    $(@).countdown $(@).data('countdown'), (e)->
      $(@).html e.strftime '<div><span>%D</span><span>days</span></div><div><span>%H</span><span>hours</span></div><div><span>%M</span><span>min</span></div> <div><span>%S</span><span>sec</span></div>'
#
#  $('.countdown').countdown "2016/01/01", (e)->
#    $(@).text e.strftime '%D days %H hours %M min %S sec'

  $('.smooth-scrolling').smoothMenu()

  $('.slider').slick
    arrows: off
    dots: on
    slidesToShow: 1
    adaptiveHeight: on

  $('.slider-gallery').slick
    arrows: off
    dots: on
    slidesToShow: 4
    slidesToScroll: 4
    responsive: [
      breakpoint: 1024
      settings:
        slidesToShow: 3
        slidesToScroll: 3
    ,
      breakpoint: 768
      settings:
        slidesToShow: 1
        slidesToScroll: 1
    ]
  $('.testimonials-slider').slick
    arrows: off
    dots: on
    slidesToShow: 1

  if $.isFunction($.mmenu)
    $('.canvas-off-nav').mmenu
      canvasOff: off

  new WOW({
    mobile: off
  }).init()

  window.sr = new scrollReveal({
    easing: 'hustle'
    mobile: on
  });

  baguetteBox.run '.slider-gallery', {}

$(window).on 'load', ()->

  setTimeout init, 1000

  $('.loader').addClass('up')
  $('body').removeClass('no-scroll')


