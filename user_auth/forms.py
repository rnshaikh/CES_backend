from django import forms
from user_auth.models import User

class UserCreateForm(forms.ModelForm):

    confirm_password = forms.CharField(widget=forms.PasswordInput)
    password = forms.CharField(widget=forms.PasswordInput)


    class Meta:
        model = User
        fields = ('email','full_name','mobile_num','password','company_name',
                'city','state','zip_code','user_type','address','date_of_birth')


    def __init__(self, *args, **kwargs):
        super(UserCreateForm, self).__init__(*args, **kwargs)
        self.fields['email'].widget.attrs.update({
                'placeholder': 'Email',
                'class': 'form-control'
            })
        self.fields['full_name'].widget.attrs.update({
                'placeholder': 'Full Name',
                'class': 'form-control'
            })
        self.fields['mobile_num'].widget.attrs.update({
                'placeholder': 'Mobile No.',
                'class': 'form-control'
            })
        self.fields['password'].widget.attrs.update({
                'placeholder': 'Password',
                'class': 'form-control'
            })
        self.fields['company_name'].widget.attrs.update({
                'placeholder': 'Company Name',
                'class': 'form-control'
            })

        self.fields['address'].widget.attrs.update({
                'placeholder': 'Address',
                'class': 'form-control'
            })
        self.fields['city'].widget.attrs.update({
                'placeholder': 'City',
                'class': 'form-control'
            })
        self.fields['state'].widget.attrs.update({
                'placeholder': 'State',
                'class': 'form-control'
            })
        self.fields['zip_code'].widget.attrs.update({
                'placeholder': 'Zip Code',
                'class': 'form-control'
            })
        self.fields['user_type'].widget.attrs.update({
                'placeholder': 'User Type',
                'class': 'form-control'
            })
        self.fields['confirm_password'].widget.attrs.update({
                'placeholder': 'Confrim Password',
                'class': 'form-control'
            })
        self.fields['date_of_birth'].widget.attrs.update({
                'placeholder': 'Date Of Birth',
                'class': 'datepicker form-control'
            })
        
        self.fields['full_name'].required = True
        self.fields['user_type'].required = True

    def clean(self): 

        super(UserCreateForm, self).clean() 

        password = self.cleaned_data.get('password') 
        confirm_password = self.cleaned_data.get('confirm_password') 

        if len(password) > 8: 
            self._errors['password'] = self.error_class([ 
            'Should be a less than 8 characters required']) 
        if( password != confirm_password):
            self._errors['password'] = self.error_class([ 
            'password and confrim_password should be same'])
        
        return self.cleaned_data 


class UserLoginForm(forms.Form):

	email =forms.CharField(label="Email" ,
					widget=forms.TextInput(
							attrs={'size':'100%' , 
									'class':'form-control',
									'data-minlength':'6'}))

	password=forms.CharField(label="Password" , 
					widget=forms.PasswordInput(
							attrs={'size':'100%' , 
								   'class':'form-control',
								   'data-minlength':'8',
								   'data-maxlength':'16'}))


class ForgotPasswordForm(forms.Form):

    email =forms.CharField(label="Email" ,
                        widget=forms.TextInput(
                        attrs={'size':'100%' , 
                        'class':'form-control',
                        'data-minlength':'6'}))

    password=forms.CharField(label="Password" , 
                        widget=forms.PasswordInput(
                        attrs={'size':'100%' , 
                        'class':'form-control',
                        'data-minlength':'8',
                        'data-maxlength':'16'}))

    confirm_password=forms.CharField(label="Password" , 
                        widget=forms.PasswordInput(
                        attrs={'size':'100%' , 
                        'class':'form-control',
                        'data-minlength':'8',
                        'data-maxlength':'16'}))

    def clean(self): 
        import pdb
        pdb.set_trace()
        
        password = self.cleaned_data.get('password') 
        confirm_password = self.cleaned_data.get('confirm_password') 

        if len(password) > 8: 
            self._errors['password'] = self.error_class([ 
            'Should be a less than 8 characters required']) 
        if( password != confirm_password):
            self._errors['password'] = self.error_class([ 
            'password and confrim_password should be same'])

        return self.cleaned_data 



class UserProfileForm(forms.ModelForm):
    # user_type = forms.CharField()
    class Meta:
        model = User
        fields = ('email','full_name','mobile_num','company_name',
                'city','state','zip_code','user_type','address','date_of_birth')


    def __init__(self, *args, **kwargs):
        super(UserProfileForm, self).__init__(*args, **kwargs)
        self.fields['email'].widget.attrs.update({
                'placeholder': 'Email',
                'class': 'form-control'
            })
        self.fields['full_name'].widget.attrs.update({
                'placeholder': 'Full Name',
                'class': 'form-control'
            })
        self.fields['mobile_num'].widget.attrs.update({
                'placeholder': 'Mobile No.',
                'class': 'form-control'
            })
        self.fields['company_name'].widget.attrs.update({
                'placeholder': 'Company Name',
                'class': 'form-control'
            })

        self.fields['address'].widget.attrs.update({
                'placeholder': 'Address',
                'class': 'form-control'
            })
        self.fields['city'].widget.attrs.update({
                'placeholder': 'City',
                'class': 'form-control'
            })
        self.fields['state'].widget.attrs.update({
                'placeholder': 'State',
                'class': 'form-control'
            })
        self.fields['zip_code'].widget.attrs.update({
                'placeholder': 'Zip Code',
                'class': 'form-control'
            })
        
        self.fields['date_of_birth'].widget.attrs.update({
                'placeholder': 'Date Of Birth',
                'class': 'datepicker form-control'
            })
        
        self.fields['user_type'].widget.attrs.update({
                'placeholder': 'User Type',
                'class': 'form-control'
            })

        self.fields['user_type'].widget.attrs['disabled'] = 'disabled'
        self.fields['email'].widget.attrs['readonly'] = True   
        
        
        self.fields['full_name'].required = True
        