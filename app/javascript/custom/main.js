// (
//     function ($) {
//
//
//     }
// )(jQuery)

console.log('helloworld!')

// $("div.messenger-container").fadeOut(5000)
// .then($("div.messenger-container").remove());


const signin_img_mediaQuery = matchMedia('(min-width: 400px) and (max-width: 1023px)')
console.log(signin_img_mediaQuery.media)

// signin_img_mediaQuery.addEventListener('change', (event) => {
//     console.log(event.matches)
//     if (event.matches) {
//
//         $("form > input[type=image]:nth-child(2)")
//             .addClass("img-fluid d-block m-auto sized-login-img")
//             .attr({width: '360'}).css('cssText', 'height: 77.0680628px !important; padding: 0 !important;')
//     } else {
//         $("form > input[type=image]:nth-child(2)")
//             .addClass("img-fluid d-block m-auto sized-login-img")
//             .attr({width: '360'}).css('cssText', 'height: 86.7015705px !important; padding: 0 !important;')
//     }
// })

function mediaSize() {
    if (window.matchMedia('(min-width: 480px) and (max-width: 1400px)').matches) {
        $("form > input[type=image]:nth-child(2)")
            .addClass("img-fluid d-block m-auto sized-login-img")
            .attr({width: '360'}).css('cssText', 'height: 86.7015705px !important; padding: 0 !important;')

        $("#new_user > div:nth-child(6) > input, #new_user > div:nth-child(5) > input.btn.btn-full").css('cssText', 'padding: 0 !important; color: #fff; border: 1px solid transparent !important; height: 62px; border: 1px solid transparent;')

    } else if (window.matchMedia('(max-width: 479px)').matches) {
        $("form > input[type=image]:nth-child(2)")
            .addClass("img-fluid d-block m-auto sized-login-img")
            .attr({width: '360'}).css('cssText', 'height: 77.0680628px !important; padding: 0 !important;')

        $("#new_user > div:nth-child(6) > input, #new_user > div:nth-child(5) > input.btn.btn-full").css('cssText', 'padding: 0 !important; color: #fff; border: 1px solid transparent !important; height: 42px; border: 1px solid transparent;')

    }
}

mediaSize();
window.addEventListener('resize', mediaSize, false);

$("#error_explanation").appear(function () {
    console.log('error_explanation present')
    $("#error_explanation").addClass('alert alert-warning alert-dismissible fade show').attr({role: 'alert'})
        .prepend("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
            "  <span aria-hidden=\"true\">&times;</span>\n" +
            "</button>")

})

$("#msg-notifier > p.alert, body > #msg-notifier > p.notice" ).appear(function () {
    console.log('notice div is present')
    $("#msg-notifier > p.alert, #msg-notifier > p.notice")
        .prepend("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
        "  <span aria-hidden=\"true\">&times;</span>\n" +
        "</button>")
})

$("#msg-notifier > p.alert, body > #msg-notifier > p.notice" ).on('closed.bs.alert', function () {
    $("#msg-notifier").delay(2000).remove()
})