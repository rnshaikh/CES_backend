from rest_framework import serializers
from user_auth.models import User




class UserSerializer(serializers.ModelSerializer):
    """
    Serializer for registering new users.
    This class excepts users details validates them
    and returns user object.
    """
    password = serializers.CharField()
    confirm_password = serializers.CharField()

    class Meta:
        model = User
        fields = (
            'id', 'password','confirm_password','email',
            'full_name', 'user_type',)
        read_only_fields = ('id', 'password','confirm_password')

    def create(self, validated_data):
        user = User.objects.create(
            email=validated_data['email'],
            full_name=validated_data['full_name'] or None,
            user_type=validated_data['user_type'],
        )

        user.set_password(validated_data['password'])
        user.save()

        return user

class UserProfileSerializer(serializers.ModelSerializer):
    """
    Serializer for registering new users.
    This class excepts users details validates them
    and returns user object.
    """

    class Meta:
        model = User
        fields = (
            'email','full_name',  'user_type', )