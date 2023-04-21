const $dateButton = document.querySelectorAll('.date')
const $menuDates = document.querySelector('.menu-dates')
const $btnMenu = document.querySelector('#wrapper-admin i')
const $allInputs = document.querySelectorAll('input')
const $errorToast = document.querySelector('.error-toast')

let activeDate = ''

$dateButton.forEach((date) => {
    date.addEventListener("click", (e) => {
        removeIsActive()

        activeDate = e.currentTarget.childNodes[1].textContent
        console.log(activeDate)
        date.classList.add("active")
        toggleMenuDates()
    })
})

$btnMenu.addEventListener('click', () => {
    toggleMenuDates()
})

function verifyInputs(){
    const textarea = document.querySelector('textarea')
    if(textarea.value.length == 0){
        console.log(textarea.placeholder)
        textarea.classList.add('error-form')
        showErrorToast()
    }
    console.log($allInputs + textarea)
    $allInputs.forEach((input) => {
        if(input.value.length == 0){
            input.classList.add('error-form')
            showErrorToast()
        }
    })
}

function removeIsActive(){
    const activeDate = document.querySelector(".container-dates").querySelector(".active")  
    activeDate ? activeDate.classList.remove('active') : null

}

function toggleMenuDates(){
    !$menuDates.classList.contains('toggle') ?
    $menuDates.classList.add('toggle') :
    $menuDates.classList.remove('toggle')
}

function showErrorToast(){
    $errorToast.classList.add('show')
    setTimeout(() => {
        $errorToast.classList.remove('show')
    }, 3000)
}