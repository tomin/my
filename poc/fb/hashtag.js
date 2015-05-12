// ==UserScript==
// @name        facebook hashtag
// @namespace   ad2
// @description beautify facebook hashtag
// @include     https://www.facebook.com/hashtag/*
// @require     https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js
// @version     1.0.0
// @grant       none
// ==/UserScript==

//allow pasting


$('#pagelet_sidebar').hide();
$('#pagelet_bluebar').hide();

$('.uiLikePageButton').hide();
$('._5pcm, ._5va0').hide();
$('#leftCol').hide();
$('#rightCol').hide();


var story_css = {
    width: '30%',
    float: 'left',
    overflow: 'hidden',
    height: '500px',
    marginRight: '1%',
};

var text_exposed_root = {
    display: 'block',
    height: '14px',
    overflow: 'hidden'
};

var globalContainer = {
    "padding-right": 0,
    "width": '100%'
};


setTimeout(function(){
    var tags = $('#hashtag_permalink_feed').html();
    $('#globalContainer').html(tags);
    $('#u_0_q_pager').hide();//login
    $('#u_0_6_pager').hide();//non login


    $('._5v3q').css(story_css);
    $('._5pbx,._5pbw').css(text_exposed_root);
    $('#globalContainer').css(globalContainer);

    // show only 3 items
    $('._5v3q').hide();
    $('._5v3q:lt(3)').show();


    $('form').hide();
}, 2000);

setTimeout(function(){
    //window.location.reload();
}, 10000);
