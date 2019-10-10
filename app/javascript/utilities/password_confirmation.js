document.addEventListener('turbolinks:load', function() {
    var input = document.querySelector('.check_confirmation')

    if (input) { input.addEventListener('input', checkDifference ) }
})

function checkDifference () {
    var passwordConf = document.getElementById('user_password_confirmation')
    var password = document.getElementById('user_password')
    var passwordValue = password.value
    var passwordConfValue = passwordConf.value

    if (passwordConfValue == '') {
        this.querySelector('.octicon-check').classList.add('hide')
        this.querySelector('.octicon-x').classList.add('hide')
    }  else if (passwordValue == passwordConfValue) {
        this.querySelector('.octicon-check').classList.remove('hide')
        this.querySelector('.octicon-x').classList.add('hide')
    } else {
        this.querySelector('.octicon-x').classList.remove('hide')
        this.querySelector('.octicon-check').classList.add('hide')
    }
}