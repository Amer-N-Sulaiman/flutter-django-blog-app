from rest_framework import serializers
from .models import Comment

class CommentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Comment
        fields = ('__all__')


    def save(self, *args, **kwargs):
        comment = Comment(
            body=self.validated_data['body'],
            author=self.author,
            article=self.article
        )

        comment.save()
        return comment