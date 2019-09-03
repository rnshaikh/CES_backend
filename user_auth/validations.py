


def check_for_input_error(input_data):

    if('full_name' not in input_data):
        return {
            "msg": "full name is required."
        }
    if('password' not in input_data):
        return {
            "msg":"password is required"
        }
    
    if('confirm_password' not in input_data):
        return {
            "msg":"confirm_password is required"
        }
    
    if(input_data['password']!= input_data['confirm_password']):

        return{
            "msg":"password and confirm password does not match."
        }

    
