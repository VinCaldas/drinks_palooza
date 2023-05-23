const $dateButton = document.querySelectorAll('.date')
const $date = document.querySelectorAll('.date span')
const $menuDates = document.querySelector('.menu-dates')
const $btnMenu = document.querySelector('#wrapper-admin i')

let activeDate = ''

if($btnMenu !== null){
    $btnMenu.addEventListener('click', () => {
        toggleMenuDates()
    })
}

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