import unittest

from helloworld.core import User


class TestUser(unittest.TestCase):
    def test_name(self):
        u = User("foo")
        self.assertEqual(u.name, "foo")
        self.assertEqual(u.name_upper, "FOO")
