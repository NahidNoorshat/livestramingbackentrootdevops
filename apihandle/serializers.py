# apihandle/serializers.py
from rest_framework import serializers
from .models import Match

class MatchSerializer(serializers.ModelSerializer):
    league_name = serializers.SerializerMethodField()

    class Meta:
        model = Match
        fields = [
            'id', 'fixture_id', 'home_team_name', 'home_team_logo', 'home_team_id',
            'away_team_name', 'away_team_logo', 'away_team_id', 'match_date', 'status',
            'home_team_score', 'away_team_score', 'liveurl', 'league_name'
        ]

    def get_league_name(self, obj):
        return obj.league.name