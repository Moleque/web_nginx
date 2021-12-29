from django.db import models
from django.contrib.auth.models import User

class Question(models.Model):
    title = models.CharField(max_length=255)    # заголовок вопроса
    text = models.TextField()                   # полный текст вопроса
    added_at = models.DateTimeField(blank = True, auto_now_add=True)           # дата добавления вопроса
    rating = models.IntegerField(default = 0)              # рейтинг вопроса (число)
    author = models.ForeignKey(User, on_delete=models.CASCADE)          # автор вопроса
    likes = models.ManyToManyField(User, related_name='question_like_user')           # список пользователей, поставивших "лайк"

class QuestionManager(models.Manager): # менеджер модели Question
    def new(self): # метод возвращающий последние добавленные вопросы
        self.order_by("-added_at")

    def popular(self): # метод возвращающий вопросы отсортированные по рейтингу
        self.order_by("-rating")

class Answer(models.Model):
    text = models.TextField(max_length=512)     #текст ответа
    added_at = models.DateTimeField()           # дата добавления ответа
    question = models.ForeignKey(Question) # вопрос, к которому относится ответ
    author = models.ForeignKey(User, on_delete=models.CASCADE) # автор ответа
