from django.test import TestCase


class TestPages(TestCase):
    def test_home(self):
        response = self.client.get('/')
        self.assertEquals(response.status_code, 200)
