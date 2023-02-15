"""Application entrypoint."""
from typing import Any

from flask import Flask, jsonify


def create_app(config: dict[str, Any] | None = None) -> Flask:
    """Build a Flask application instance."""
    app = Flask(__name__)

    if config is not None:
        app.config.update(config)

    @app.get("/")
    def index():
        """Index route"""
        return jsonify({"hello": "world"})

    @app.get("/api")
    def api():
        """API route"""
        return jsonify({"hello": "api"})


    return app
