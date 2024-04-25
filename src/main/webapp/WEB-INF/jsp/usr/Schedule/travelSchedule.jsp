<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Schedule PAGE"></c:set>
<%@ include file="../common/head.jspf"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 제이쿼리  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css">

<style>

@charset "UTF-8";

@import url("https://fonts.googleapis.com/css?family=Raleway:400,300,600");

#calendar-details .check-in, #calendar-details .check-out, #calendar-details .arrow {
  float: left;
  white-space: nowrap;
  width: 39.3333333333%;
  margin-left: 4%;
}
#calendar-details h5 {
  font-size: 1.8rem;
  margin-bottom: 0;
}
#calendar-details .check-in {
  text-align: right;
  margin-left: 0;
}
#calendar-details .arrow {
  width: 13.3333333333%;
  margin-top: 0.5em;
  font-size: 2em;
  line-height: 1em;
  text-align: center;
}
#calendar-details .arrow:before {
  display: inline-block;
  content: "→";
}

.ui-datepicker * {
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  outline: 0;
}
.ui-datepicker.ui-datepicker-multi {
  width: 100% !important;
  max-width: 24em;
  margin: 0 auto;
}
.ui-datepicker.ui-datepicker-multi .ui-datepicker-group {
  width: 100%;
}
.ui-datepicker.ui-datepicker-multi.ui-datepicker-multi-2 {
  max-width: 50em;
}
.ui-datepicker.ui-datepicker-multi.ui-datepicker-multi-2 .ui-datepicker-group {
  width: 45%;
}
.ui-datepicker.ui-datepicker-multi.ui-datepicker-multi-2 .ui-datepicker-group.ui-datepicker-group-first {
  padding-right: 5%;
}
.ui-datepicker.ui-datepicker-multi.ui-datepicker-multi-2 .ui-datepicker-group.ui-datepicker-group-last {
  padding-left: 5%;
}
.ui-datepicker.ui-datepicker-multi.ui-datepicker-multi-3 {
  max-width: 70em;
}
.ui-datepicker.ui-datepicker-multi.ui-datepicker-multi-3 .ui-datepicker-group {
  width: 30%;
}
.ui-datepicker.ui-datepicker-multi.ui-datepicker-multi-3 .ui-datepicker-group.ui-datepicker-group-middle {
  padding: 0 3.33%;
}
.ui-datepicker td a, .ui-datepicker td span {
  border: 1px solid #fff;
  border-radius: 0.5em;
  text-align: center;
  width: 2em;
}
.ui-datepicker td a.ui-state-active, .ui-datepicker td span.ui-state-active {
  background-color: #1EAEDB;
  color: #fff;
}
.ui-datepicker td a.ui-state-hover, .ui-datepicker td span.ui-state-hover {
  border-color: #1EAEDB;
}
.ui-datepicker td.ui-datepicker-reserved a, .ui-datepicker td.ui-datepicker-reserved span {
  background-color: #1EAEDB;
  color: #fff;
}
.ui-datepicker td.ui-datepicker-reserved.ui-datepicker-checkin a, .ui-datepicker td.ui-datepicker-reserved.ui-datepicker-checkin span, .ui-datepicker td.ui-datepicker-reserved.ui-datepicker-checkout a, .ui-datepicker td.ui-datepicker-reserved.ui-datepicker-checkout span {
  background-color: #fff;
  border-color: #1EAEDB;
  color: #1EAEDB;
}
.ui-datepicker .ui-datepicker-today a:not(.ui-state-hover), .ui-datepicker .ui-datepicker-today span:not(.ui-state-hover) {
  border-color: #11DFC7;
  color: #11DFC7;
}
.ui-datepicker .ui-datepicker-prev,
.ui-datepicker .ui-datepicker-next {
  border: 1px solid #fff;
  border-radius: 0.5em;
  text-align: center;
  text-indent: 0;
}
.ui-datepicker .ui-datepicker-prev:before, .ui-datepicker .ui-datepicker-prev:after,
.ui-datepicker .ui-datepicker-next:before,
.ui-datepicker .ui-datepicker-next:after {
  display: inline-block;
}
.ui-datepicker .ui-datepicker-prev.ui-state-hover,
.ui-datepicker .ui-datepicker-next.ui-state-hover {
  border-color: #1EAEDB;
  top: 2px;
}
.ui-datepicker .ui-datepicker-prev:before {
  content: "←";
}
.ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-prev.ui-state-hover {
  left: 10px;
}
.ui-datepicker .ui-datepicker-next:after {
  content: "→";
}
.ui-datepicker .ui-datepicker-next, .ui-datepicker .ui-datepicker-next.ui-state-hover {
  right: 10px;
}

hide {
  opacity: 0;
}

show {
  opacity: 1;
}

.fade-in {
  -webkit-animation-duration: 1s;
          animation-duration: 1s;
  -webkit-animation-name: fade-in;
          animation-name: fade-in;
}

/* Larger than mobile */
@media (min-width: 400px) {
  .ui-datepicker {
    min-width: 18em;
  }
}
/* Larger than phablet (also point when grid becomes active) */
/* Larger than tablet */
@media (min-width: 750px) {
  .ui-datepicker {
    min-width: 34em;
  }

  .arrow {
    margin-top: 0;
    font-size: 3em;
  }
}
/* Larger than desktop */
@media (min-width: 1000px) {
  .ui-datepicker {
    min-width: 51em;
  }
}

/* Larger than Desktop HD */

@-webkit-keyframes fade-in {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
@keyframes fade-in {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
</style>


<script>
$(function() {
	  'use strict';

	  var checkIn, checkOut, numberOfMonths = [2, 3],
	      $calendar = $('#calendar').datepicker({
	        numberOfMonths: numberOfMonths,
	        prevText: '',
	        nextText: '',
	        beforeShowDay: function(date) {
	          date = moment(date);

	          var now = moment(),
	              show = date.isAfter(now),
	              css = '';

	          if (checkIn && checkOut 
	              && date.isSameOrAfter(checkIn)
	              && date.isSameOrBefore(checkOut)) {
	            css = 'ui-datepicker-reserved';

	            if (date.isSame(checkIn)) css += ' ui-datepicker-checkin';
	            if (date.isSame(checkOut)) css += ' ui-datepicker-checkout';
	          }

	          return [show, css];
	        },
	        onSelect: function(value) {
	          var date = moment($calendar.datepicker('getDate'));

	          if (checkIn && !checkOut
	              && date.isSameOrAfter(checkIn)) 
	            checkOut = date;
	          else {
	            checkIn = date;
	            checkOut = null;
	          }
	          
	          $('#check-in-date').text(checkIn ? checkIn.format('DD/MM/YYYY') : 'Choose a date');
	          $('#check-out-date').text(checkOut ? checkOut.format('DD/MM/YYYY') : 'Choose a date');
	        },
	        onChangeMonthYear: function() {
	          $calendar.addClass('fade-in');
	        }
	      }).on('animationend webkitAnimationEnd', function() {
	        $calendar.removeClass('fade-in');
	      });
	  
	  function resize() {
	    var element = $('.ui-datepicker').get(0),
	        style = window.getComputedStyle(element).getPropertyValue('min-width'), 
	        value;
	    
	    switch (style) {
	      case '765px': value = [2, 3]; break;
	      case '510px': value = [2, 2]; break;
	      default: value = [2, 1]; break;
	    }
	    
	    if (numberOfMonths !== value) {
	      if (checkIn) $calendar.datepicker('setDate', checkIn.toDate());
	      
	      $calendar.datepicker('option', 'numberOfMonths', numberOfMonths = value);
	    }
	  }

	  $(window).on('resize', resize);
	  
	  resize();
	});
</script>

<div class="container">
  <div id="calendar-details">
    <div class="check-in">
      <h5>Check-In</h5>
      <h6 id="check-in-date">Choose a date</h6>
    </div>
    <div class="arrow"></div>
    <div class="check-out">
      <h5>Check-Out</h5>
      <h6 id="check-out-date">Choose a date</h6>
    </div>
  </div>
  <div id="calendar"></div>
</div>


<%@ include file="../common/foot.jspf"%>