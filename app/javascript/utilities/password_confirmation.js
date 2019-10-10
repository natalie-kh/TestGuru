document.addEventListener('input', function() {
    var input = document.querySelector('.check_confirmation')

    if (input) { input.addEventListener('input', checkDifference ) }
})

function checkDifference () {
    var password_conf = document.getElementById('user_password_confirmation')
    var password = document.getElementById('user_password')
    var password_value = password.value
    var password_conf_value = password_conf.value

    if (password_conf_value == '') {
        this.querySelector('.octicon-check').classList.add('hide')
        this.querySelector('.octicon-x').classList.add('hide')
    }  else if (password_value == password_conf_value) {
        this.querySelector('.octicon-check').classList.remove('hide')
        this.querySelector('.octicon-x').classList.add('hide')
    } else {
        this.querySelector('.octicon-x').classList.remove('hide')
        this.querySelector('.octicon-check').classList.add('hide')
    }
}