
var flash_cleanup = function() {
  if($('.error')) {
    $('.error').remove();
  }
  if($('.notice')) {
    $('.notice').remove();
  }
};

var rounder = function(elem, sz, allBrowsers) {
  // rounded corners JS, handles IE7, 8 too:
  DD_roundies.addRule(elem, sz.toString()+'px', allBrowsers);
}

$(function() {
  var rndrs = ['.company-data', '.toolbar', '.toolbar a', '.button', '.actions a', '.actions input', '#people-search input[type="submit"]'];
  for(r in rndrs) {
    rounder(rndrs[r], 5, true);
  }
  
  // AJAX link handler for companies#index page
  if($('.staffers-link, .remoter').length) {
    $('.staffers-link, .remoter').click(function(event) {
      $.get(event.target.href, 
        function(html) {
          flash_cleanup();
          $('#secondary').html(html);
          $('#primary').css('border-right','1px solid #210000');
          return false;
        }
      );
    });
  }
  
  // Cancel link handler
  $('.canceler').live('click', function() {
    $('#secondary').empty();
    $('#primary').css('border-right','none');
    // only return false on remote/AJAX cancels
    return !($(this).attr('data-remote'));
  });
  
  // Google Maps integration
  if($('.remoteMap').length) {
    $('.remoteMap').click(function(event) {
      $.get(event.target.href, 
        function(html) {
          flash_cleanup();
          $('#secondary').html(html);
          var coname, ccity, cstate;
          coname = $('.company-data').attr('id');
          ccity = $('.company-city').attr('id');
          cstate = $('.company-state').attr('id');
          $("#map").gMap({latitude: 37.406, longitude: -122.077, zoom: 10, markers: [{latitude: 37.406, longitude: -122.077, html: '<strong>'+coname+'<br/>'+ccity+', '+cstate+'</strong>', popup: true}], controls: ['GMenuMapTypeControl','GSmallZoomControl3D']});
          $('#primary').css('border-right','1px solid #210000');
          return false;
        }
      );
    });
  }
});