/**Scroll nav*/
$(window).scroll(function(){
    $('nav').toggleClass('scrolled', $(this).scrollTop()>400);
  });

/** First Slider */
$(".slider-one")
    .not(".slick-intialized")
    .slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 2000,
        prevArrow :".site-slider .slider-btn .prev",
        nextArrow :".site-slider .slider-btn .next",
        
    });

/** Second Slider */

$('.hot-class-wrapper')
.slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 1,
    prevArrow: ".hot-class-slider .slider-btn .prev",
    nextArrow: ".hot-class-slider .slider-btn .next",
    responsive: [
        {
          breakpoint: 1600,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1,
            infinite: true,
          }
        },
        {
          breakpoint: 1280,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 900,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
        // You can unslick at a given breakpoint now by adding:
        // settings: "unslick"
        // instead of a settings object
      ]
});

$(document).ready(function() {
  $('#example').DataTable( {
      responsive: {
          details: {
              display: $.fn.dataTable.Responsive.display.modal( {
                  header: function ( row ) {
                      var data = row.data();
                      return 'Details for '+data[0]+' '+data[1];
                  }
              } ),
              renderer: $.fn.dataTable.Responsive.renderer.tableAll( {
                  tableClass: 'table'
              } )
          }
      }
  } );
} );

