document.addEventListener('turbolinks:load', function() {
    const input = document.querySelector('.check_confirmation')

    if (input) { input.addEventListener('input', checkDifference ) }
})

function checkDifference () {
    const passwordConf = document.getElementById('user_password_confirmation')
    const password = document.getElementById('user_password')
    const passwordValue = password.value
    const passwordConfValue = passwordConf.value

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