from django.shortcuts import render
from django import forms
from django.conf import settings
from django.contrib import messages
from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import get_object_or_404
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from django.contrib.auth import (authenticate, login, logout,)
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy,reverse
from user_auth.models import User
from user_auth.forms import UserCreateForm,UserLoginForm,UserProfileForm

def home(request):
    
    return render(request, 'user_auth/home.html')


class CreateUserView(CreateView):
    """
    Creating API for User creation which takes user
    details(email,full_name, grade, sector, password, profile_url, qualification, line manager,
    department as input validates the user details and
    creates a user account.
    """
    template_name = 'user_auth/user_form.html'
    form_class = UserCreateForm

    def post(self, request, *args, **kwargs):
        form = UserCreateForm(request.POST)
        if form.is_valid():
            password= form.cleaned_data['password']
            User = form.save()
            User.set_password(password)
            User.save()
            msg = "Hello"+User.full_name+"registered successfully"
            messages.success(request, msg)
            return HttpResponseRedirect(reverse_lazy('home'))
        return render(request, 'user_auth/user_form.html', {'form': form})


def login_view(request):

        form = UserLoginForm(request.POST or None)
        if form.is_valid():
            import pdb
            pdb.set_trace()
            username = form.cleaned_data['email']
            password = form.cleaned_data['password']
            user = authenticate(username=username, password=password)
            
            if user is not None:
                if user.is_active:
                    login(request, user)
                    response = {'status': 'success',
                                'message': "good"}
                    return HttpResponseRedirect(reverse_lazy('home'))
                else:
                    messages.success(request, "User is inactive try again.")
                    return HttpResponseRedirect(reverse_lazy('home'))
            else:
                messages.success(request, "Invalid Email And Password.")
                return HttpResponseRedirect(reverse_lazy('user_login'))
            
            messages.success(request, "User Does Not Exist.")
            return HttpResponseRedirect(reverse_lazy('user_login'))
        return render(request, 'user_auth/login.html', {'form': form})

def logout_view(request):

    logout(request)
    return HttpResponseRedirect(reverse_lazy('home'))



def user_update(request):
    user = User.objects.get(id=request.user.id)
    if request.method=="POST":
        user_type = user.user_type
        form = UserProfileForm(request.POST or None,instance=user)
        if form.is_valid():
            user = form.save(commit=False)
            user.user_type = user_type
            user.save()
            msg  = "User Profile update successfully."
            messages.success(request,msg)
            return HttpResponseRedirect(reverse_lazy('user_update'))
        return HttpResponseRedirect(reverse_lazy('user_update'))
    else:
        form = UserProfileForm(instance=user)
        return render(request, 'user_auth/edit_profile.html', {'form': form})