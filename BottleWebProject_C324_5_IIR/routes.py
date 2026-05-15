"""
Routes and views for the bottle application.
"""

from bottle import route, view, request
from datetime import datetime

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year,
        current_path=request.path
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='Об авторах',
        year=datetime.now().year,
        current_path=request.path
    )

@route('/simulations')
@route('/simulations/<sim_type>')
@view('simulations')
def simulations(sim_type='river'):
    """Renders the simulations page."""
    # Проверяем, что тип симуляции валидный
    valid_types = ['river', 'launch', 'trains']
    if sim_type not in valid_types:
        sim_type = 'river'

    return dict(
        title='Симуляции',
        year=datetime.now().year,
        current_path=request.path,
        simulation=sim_type
    )
