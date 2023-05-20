const $dateButton = document.querySelectorAll('.date')
const $date = document.querySelectorAll('.date span')
const $menuDates = document.querySelector('.menu-dates')
const $btnMenu = document.querySelector('#wrapper-admin i')
const $allInputs = document.querySelectorAll('.input')
const $errorToast = document.querySelector('.error-toast')
const $appointmentPage = document.querySelector('#appointment-page')
const $suggestionsContainer = document.querySelector('.suggestions')
const $inputPhone = document.querySelector('input[name=telefone]')
const $btnEnviar = document.querySelector('.btnEnviar')


let activeDate = ''

$dateButton.forEach((date) => {   
    date.childNodes[1].textContent = formatDate(date.childNodes[1].textContent)
    date.addEventListener("click", (e) => {
        activeDate = e.currentTarget.childNodes[1].textContent
        localStorage.setItem("activeDate", activeDate)
        window.location.replace("admin.jsp?date="+formatDateForQuery(activeDate));

        activeDate = formatDate(activeDate)
        toggleMenuDates()
    })
})

window.onload = () => {
    localStorage.key("activeDate")
    $date.forEach((date) => {
        if(date.textContent === localStorage.getItem("activeDate")){
            date.parentNode.classList.add("active")
        }
    })
}

if($btnMenu !== null){
    $btnMenu.addEventListener('click', () => {
        toggleMenuDates()
    })
}

document.querySelector('.form').addEventListener('focusin', () =>{
    phoneMask($inputPhone)
})

function verifyInputs(){
    $allInputs.forEach((input) => {
        if(input.value.length == 0){
            input.classList.add('error-form')
            showErrorToast("Todos os campos devem ser preenchidos!")
        }
        if(input.placeholder == 'E-mail'){
            if(input.value.indexOf('@') == -1){
                input.classList.add('error-form')
                showErrorToast("E-mail inválido!")
           }          
        }    
    })
}

function formatDate(date){
    date = date.replaceAll("-", "")
    let year = date.slice(0, 4)
    let month = date.slice(4, 6)
    let day = date.slice(6, 8)
    return `${day}/${month}/${year}`

}

function formatDateForQuery(date){
    date = date.replaceAll("/", "")
    let year = date.slice(4, 8)
    let month = date.slice(2, 4)
    let day = date.slice(0, 2)
    return `${year}-${month}-${day}`
}

function toggleMenuDates(){
    !$menuDates.classList.contains('toggle') ?
    $menuDates.classList.add('toggle') :
    $menuDates.classList.remove('toggle')
}

function showErrorToast(message){
    document.querySelector('.message').textContent = message
    $errorToast.classList.add('show')
    setTimeout(() => {
        $errorToast.classList.remove('show')
    }, 3000)
}

function showSuggestions(){
    $suggestionsContainer.classList.add('showSuggestions')
}

function hideSuggestions(){
    $suggestionsContainer.classList.remove('showSuggestions')
}

const phoneMask = (valor) => {
    let test = valor.value
    test = test.replace(/\D/g, "")
    test = test.replace(/^(\d{2})(\d)/g, "($1) $2")
    test = test.replace(/(\d)(\d{4})$/, "$1-$2")
    valor.value = test
}

function onlyNumberKey(evt) {
              
    // Only ASCII character in that range allowed
    var ASCIICode = (evt.which) ? evt.which : evt.keyCode
    if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
        return false;
    return true;
}
