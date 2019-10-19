document.addEventListener('turbolinks:load', function() {
    var selector = document.getElementById('badge_rule')

    if (selector) { selector.addEventListener('change', changeField ) }
})

function changeField () {
    var field = document.querySelector('.rule_value_field')
    var selector = document.getElementById('badge_rule')

    if (selector.value === 'by_attempt') {
        field.placeholder= 'Test Title'

    } else if (selector.value === 'by_level') {
        field.placeholder= 'Test Level'
    } else if ((selector.value === 'by_category')){
        field.placeholder= 'Test Category'
    } else {
        field.placeholder= 'Rule Value'
    }
}