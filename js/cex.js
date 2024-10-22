/*
  [JS Index]
  
  ---
  
  Template Name: Cex - One Page Portfolio Template
  Author:  ex-nihilo
  Version: 1.0
*/


/*
  1. preloader
  2. fadeIn.element
  3. navigation
  4. switchers
    4.1. header navigation mobile and logo color switch
    4.2. header color switch, header navigation desktop color switch, link menu color switch
    4.3. header logo switch
  5. to top arrow animation
  6. home fadeOut animation
  7. forms
    7.1. contact form
  8. modals
    8.1. contact modal
	  8.1.1. contact modal additional CLOSER
  9. YouTube player
  10. slick slider
    10.1. slick fullscreen slideshow ZOOM/FADE
  11. swiper slider
    11.1. swiper parallax slider
	11.2. swiper news slider
  12. magnificPopup
    12.1. magnificPopup news gallery
  13. facts counter
  14. skills bar
  15. owl carousel
    15.1. owl home IMG carousel slider
*/


$(function() {
    "use strict";
	
	
    $(window).on("load", function() {
        // 1. preloader
        $("#preloader").fadeOut(600);
        $(".preloader-bg").delay(400).fadeOut(600);
		
        // 2. fadeIn.element
        setTimeout(function() {
            $(".fadeIn-element").delay(600).css({
                display: "none"
            }).fadeIn(800);
        }, 0);
    });
	
    // 3. navigation
    $('a[href*="#"]:not([href="#"])').on("click", function() {
        console.log("click");
        if (location.pathname.replace(/^\//, "") == this.pathname.replace(/^\//, "") && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=" + this.hash.slice(1) + "]');
            if (target.length) {
                if ($(window).width() < 768) {
                    $("html, body").animate({
                        scrollTop: target.offset().top - 87
                    }, 1000);
                } else {
                    $("html, body").animate({
                        scrollTop: target.offset().top - 69
                    }, 1000);
                }
                return false;
            }
        }
    });
	
    $(window).on("scroll", function() {
        // 4. switchers
        // 4.1. header navigation mobile and logo color switch
        if ($(this).scrollTop() > 5) {
            $(".header-navigation-xs").addClass("header-navigation-xs-dark");
            $(".header-navigation-xs .logo-holder").addClass("logo-holder-dark");
        } else {
            $(".header-navigation-xs").removeClass("header-navigation-xs-dark");
            $(".header-navigation-xs .logo-holder").removeClass("logo-holder-dark");
        }
        // 4.2. header color switch, header navigation desktop color switch, link menu color switch
        if ($(this).scrollTop() > 100) {
            $("header").addClass("navigation-bg-light");
            $(".header-navigation").addClass("header-navigation-dark");
            $(".link-underline-menu").addClass("link-underline-menu-dark");
        } else {
            $("header").removeClass("navigation-bg-light");
            $(".header-navigation").removeClass("header-navigation-dark");
            $(".link-underline-menu").removeClass("link-underline-menu-dark");
        }
        // 4.3. header logo switch
        if ($(this).scrollTop() > 500) {
            $("header .header-navigation .logo-holder").removeClass("closed");
        } else {
            $("header .header-navigation .logo-holder").addClass("closed");
        }
		
        // 5. to top arrow animation
        if ($(this).scrollTop() > 400) {
            $(".to-top-arrow").addClass("show");
        } else {
            $(".to-top-arrow").removeClass("show");
        }
		
        // 6. home fadeOut animation
        $("h1.home-page-title, h2.home-page-title, .the-button-wrapper, .social-icons-wrapper, .copyright-home, .scroll-line").css("opacity", 1 - $(window).scrollTop() / 500);
    })
	
    // 7. forms
    // 7.1. contact form
    $("form#form").on("submit", function() {
        $("form#form .error").remove();
        var s = !1;
        if ($(".requiredField").each(function() {
                if ("" === jQuery.trim($(this).val())) $(this).prev("label").text(), $(this).parent().append('<span class="error">This field is required</span>'), $(this).addClass(
                    "inputError"), s = !0;
                else if ($(this).hasClass("email")) {
                    var r = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                    r.test(jQuery.trim($(this).val())) || ($(this).prev("label").text(), $(this).parent().append('<span class="error">Invalid email address</span>'), $(this).addClass(
                        "inputError"), s = !0);
                }
            }), !s) {
            $("form#form input.submit").fadeOut("normal", function() {
                $(this).parent().append("");
            });
            var r = $(this).serialize();
            $.post($(this).attr("action"), r, function() {
                $("form#form").slideUp("fast", function() {
                    $(this).before('<div class="success">Your email was sent successfully.</div>');
                });
            });
        }
        return !1;
    });
	
    // 8. modals
    // 8.1. contact modal
    $(".contact-modal-launcher, .contact-modal-closer").on("click", function() {
        if ($(".contact-modal").hasClass("open")) {
            $(".contact-modal").removeClass("open");
            $(".contact-modal").addClass("close");
        } else {
            $(".contact-modal").removeClass("close");
            $(".contact-modal").addClass("open");
        }
    });
    // 8.1.1. contact modal additional CLOSER
    $(".header-navigation a, .header-navigation-xs a").on("click", function() {
        $(".contact-modal").removeClass("open");
        $(".contact-modal").addClass("close");
    });
	
    // 9. YouTube player
    $("#bgndVideo").YTPlayer();
	
    // 10. slick slider
    // 10.1. slick fullscreen slideshow ZOOM/FADE
    $(".slick-fullscreen-slideshow-zoom-fade").slick({
        arrows: false,
        initialSlide: 0,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        prevArrow: "<i class='slick-prev icon ion-chevron-left'></i>",
        nextArrow: "<i class='slick-next icon ion-chevron-right'></i>",
        fade: true,
        autoplay: true,
        autoplaySpeed: 4000,
        cssEase: "cubic-bezier(0.7, 0, 0.3, 1)",
        speed: 1600,
        draggable: true,
        dots: false,
        pauseOnDotsHover: true,
        pauseOnFocus: false,
        pauseOnHover: false
    });
	
    // 11. swiper slider
	// 11.1. swiper parallax slider
    var swiper = new Swiper(".parallax .swiper-container", {
        autoplay: true,
        speed: 800,
        parallax: true,
        mousewheelControl: false,
        keyboardControl: false,
        navigation: false,
        paginationClickable: true
    });
    // 11.2. swiper news slider
    var textBottom = new Swiper(".news-bottom", {
        a11y: true,
        spaceBetween: 0,
        slidesPerView: 1,
        loop: true,
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
        simulateTouch: false,
        on: {
            init: function() {
                $(".swiper-slide:not(.swiper-slide-active)").attr("aria-hidden", true);
                $(".swiper-slide-active").attr('aria-hidden', false);
            },
            slideChangeTransitionEnd: function() {
                $(".swiper-slide-active:not(.swiper-slide-prev, .swiper-slide-next)").attr("aria-hidden", false);
                $(".swiper-slide:not(.swiper-slide-active)").attr("aria-hidden", true);
            }
        }
    });
    var galleryTop = new Swiper(".news-top", {
        a11y: true,
        spaceBetween: 0,
        loop: true,
        fadeEffect: {
            crossFade: true
        },
        on: {
            init: function() {
                $(".swiper-slide:not(.swiper-slide-active)").attr("aria-hidden", true);
                $(".swiper-slide-active").attr("aria-hidden", false);
            },
            slideChangeTransitionEnd: function() {
                $(".swiper-slide-active:not(.swiper-slide-prev, .swiper-slide-next)").attr("aria-hidden", false);
                $(".swiper-slide:not(.swiper-slide-active)").attr("aria-hidden", true);
            }
        },
        navigation: {
            nextEl: ".swiper-container-news .swiper-button-next",
            prevEl: ".swiper-container-news .swiper-button-prev",
        },
        pagination: {
            el: ".swiper-container-news .swiper-pagination",
            type: "bullets",
        },
        thumbs: {
            swiper: textBottom,
        }
    });
	
    // 12. magnificPopup
    // 12.1. magnificPopup news gallery
    $(".popup-photo-gallery").each(function() {
        $(this).magnificPopup({
            delegate: "a",
            type: "image",
            gallery: {
                enabled: true
            },
            removalDelay: 100,
            mainClass: "mfp-fade",
            fixedContentPos: false
        });
    });
	
    // 13. facts counter
    $(".facts-counter-number").appear(function() {
        var count = $(this);
        count.countTo({
            from: 0,
            to: count.html(),
            speed: 1200,
            refreshInterval: 60
        });
    });
	
    // 14. skills bar
    $(".show-skillbar").appear(function() {
        $(".skillbar").skillBars({
            from: 0,
            speed: 4000,
            interval: 100,
            decimals: 0
        });
    });
	
	// 15. owl carousel
	// 15.1. owl home IMG carousel slider
    $("#home-page-img-carousel").owlCarousel({
        loop: true,
        center: true,
        items: 3,
        margin: 0,
        autoplay: true,
        autoplaySpeed: 1000,
        autoplayTimeout: 5000,
        smartSpeed: 450,
        nav: false,
        responsive: {
            0: {
                items: 2
            },
            768: {
                items: 2
            },
            1170: {
                items: 3
            }
        }
    });
	
	
});