<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - Kinematics Lab</title>
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css?v=13" />
    % if title == 'Home Page':
    <link rel="stylesheet" type="text/css" href="/static/content/index_style.css?v=13" />
    % end
    % if title == 'Симуляции':
    <link rel="stylesheet" type="text/css" href="/static/content/simulations_style.css?v=6" />
    % end
    % if title == 'Об авторах':
    <link rel="stylesheet" type="text/css" href="/static/content/about_style.css" />
    % end
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
</head>

<body>
    <!-- Шапка сайта -->
    <header class="header">
        <div class="header-container">
            <!-- Логотип и название -->
            <a href="/" class="logo-link">
                <div class="logo-wrapper">
                    <div class="logo-glow"></div>
                    <div class="logo-circle">
                        <svg class="logo-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="3" />
                            <circle cx="12" cy="12" r="8" stroke-dasharray="2 4" />
                            <circle cx="12" cy="12" r="11" stroke-dasharray="2 4" />
                        </svg>
                    </div>
                </div>
                <div class="logo-text">
                    <h1>Kinematics Lab</h1>
                    <p>Интерактивные физические симуляции</p>
                </div>
            </a>

            <!-- Навигация -->
            <nav class="nav">
                <a href="/home" class="nav-link {{'active' if current_path in ['/', '/home'] else ''}}">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
                        <polyline points="9 22 9 12 15 12 15 22"/>
                    </svg>
                    Главная
                </a>
                <a href="/simulations" class="nav-link {{'active' if current_path == '/simulations' else ''}}">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4.5 3h15"/>
                        <path d="M6 3v16a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V3"/>
                        <path d="M6 14h12"/>
                    </svg>
                    Симуляции
                </a>
                <a href="/about" class="nav-link {{'active' if current_path == '/about' else ''}}">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M22 21v-2a4 4 0 0 0-3-3.87"/>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                    </svg>
                    Об авторах
                </a>
            </nav>
        </div>
    </header>

    <!-- Основной контент -->
    <div class="container body-content">
        {{!base}}
    </div>

    <!-- Подвал сайта -->
    <footer class="footer">
        <div class="footer-container">
            <h3 class="footer-title">Kinematics Lab</h3>

            <nav class="footer-nav">
                <a href="/home" class="footer-link">Главная</a>
                <a href="/simulations" class="footer-link">Симуляции</a>
                <a href="/about" class="footer-link">Об авторах</a>
            </nav>
        </div>

        <div class="footer-bottom">
            <p>&copy; {{ year }} Kinematics Lab</p>
        </div>
    </footer>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
    <script src="/static/scripts/respond.js"></script>
    % if title == 'Симуляции':
    <script src="/static/scripts/onboarding_tour.js"></script>
    <script src="/static/scripts/tooltips.js"></script>
    <script src="/static/scripts/launch_simulation.js"></script>
    <script src="/static/scripts/trains_meeting.js"></script>
    <script src="/static/scripts/river_crossing.js"></script>
    % end

</body>
</html>
