from datetime import datetime as dt
import pytz, uuid

from flask import current_app as app, request, make_response

from app import db
from app.models import match as model



@app.route('/matches', methods=['POST'])
def create_user():
    """Create an account."""
    app.logger.info("Accessing to /matches POST method")
    data = request.get_json()
    if data.get('match_name', None):
        new_match = model.Match(
            match_name=data['match_name'],
            match_date_time=dt(2020, 1, 10, 23, 30, tzinfo=pytz.timezone('UTC')))
        db.session.add(new_match)  # Adds new User record to database
        db.session.commit()  # Commits all changes
        app.logger.info('Commit successfull')
        return make_response(f"{new_match} successfully created")
    else:
        return make_response(f"Name can't be null!")