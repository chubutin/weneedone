"""Flask config class."""
import os


class Config:
    """Set Flask configuration vars."""

    # General Config
    TESTING = True
    DEBUG = True
    SECRET_KEY = b'_5#y2L"F4Q8z\n\xec]/'
    SESSION_COOKIE_NAME = 'my_cookie'

    # Database
    SQLALCHEMY_DATABASE_URI = os.environ.get('SQLALCHEMY_DATABASE_URI',
                                             'postgresql+psycopg2://test:test@0.0.0.0:5405/fulbito')
    SQLALCHEMY_USERNAME = 'test'
    SQLALCHEMY_PASSWORD = 'test'
    SQLALCHEMY_DATABASE_NAME = 'test'
    SQLALCHEMY_TABLE = 'migrations'
    SQLALCHEMY_DB_SCHEMA = 'public'
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    # Test User Details
    TEST_USER = 'Johnny "My Real Name" Boi'
    TEST_PASSWORD = 'myactualpassword'
    TEST_SOCIAL_SECURITY_NUMBER = '420-69-1738'
    TEST_SECURITY_QUESTION = 'Main Street, USA'