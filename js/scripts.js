const $dateButton = document.querySelectorAll('.date')
const $date = document.querySelectorAll('.date span')
const $menuDates = document.querySelector('.menu-dates')
const $btnMenu = document.querySelector('#wrapper-admin i')
const $allInputs = document.querySelectorAll('.input')
const $errorToast = document.querySelector('.error-toast')
const $appointmentPage = document.querySelector('#appointment-page')
const $suggestionsContainer = document.querySelector('.suggestions')
const $inputPhone = document.querySelector('input[name=telefone]')
const $form = document.querySelector('.form')
const $btnSubmit = document.querySelector('.btnEnviar')

let isSubmited = window.location.href.split('?')[1]
IsSubmited()


document.querySelector('.form').addEventListener('focusin', () =>{
    phoneMask($inputPhone)
})

function verifyInputs(event){
    $allInputs.forEach((input) => {
        if(input.value.length == 0){
            input.classList.add('error-form')
            showErrorToast("Todos os campos devem ser preenchidos!")
            return event.preventDefault();
        }
        if(input.placeholder == 'E-mail'){
            if(input.value.indexOf('@') == -1){
                input.classList.add('error-form')
                showErrorToast("E-mail inválido!")
                return event.preventDefault();
           }          
        }    
    })
}

$form.addEventListener('submit', (e) => {
    verifyInputs(e)
})

function IsSubmited(){
    if(isSubmited){
        showSuccessToast("Formulário enviado!");
    }
}

function showSuccessToast(message){
    const $successToast = document.querySelector('.success')
    document.querySelector('.success .message').textContent = message
    $successToast.classList.add('show')
    setTimeout(() => {
        $successToast.classList.remove('show')
    }, 3000)
}

function showErrorToast(message){
    document.querySelector('.message').textContent = message
    $errorToast.classList.add('show')
    setTimeout(() => {
        $errorToast.classList.remove('show')
    }, 5000)
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
