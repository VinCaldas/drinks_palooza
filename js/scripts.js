const $button = document.querySelector('.btnAgende')
const $rightSide = document.querySelector('.right-side')
const $pagAppointment = document.querySelector('#appointment-page')
const $btnBack = document.querySelector('.btnBack')
const $scrollContainer = document.querySelector('.scroll-container')

$button.addEventListener('click', function(){
    $scrollContainer.scrollTo(0, $pagAppointment.offsetTop)
})

$btnBack.addEventListener('click', function(){
    $scrollContainer.scroll(0, 0)
})