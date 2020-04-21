from sqlalchemy.dialects.postgresql import UUID
import uuid, pytz, datetime

from app import db


class Match(db.Model):
    """Model for matches."""
    __table_args__ = {"schema": "fulbito_schema"}
    __tablename__ = 'matches'

    id = db.Column(UUID(as_uuid=True),  primary_key=True, default=uuid.uuid4, unique=True, nullable=False)
    match_name = db.Column(db.String(64), index=False, unique=True, nullable=False)
    created_at = db.Column(db.DateTime(timezone=True),
                           default=datetime.datetime.now(tz=pytz.timezone('UTC')), nullable=False)
    match_date_time = db.Column(db.DateTime(timezone=True), nullable=False)
    related_last_match = db.Column(UUID(as_uuid=True), nullable=True)
    created_by = db.Column(UUID(as_uuid=True), nullable=False)


    def __repr__(self):
        return '<Match {}>'.format(self.match_name)
