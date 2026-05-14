% rebase('layout.tpl', title='Home Page', year=year)

<!-- Hero секция главной страницы -->
<section class="hero-section">
    <!-- Иконка -->
    <div class="hero-icon-wrapper">
        <div class="hero-icon-glow"></div>
        <div class="hero-icon-circle">
            <svg class="hero-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                <circle cx="12" cy="12" r="3" />
                <circle cx="12" cy="12" r="7" stroke-dasharray="2 3" />
                <circle cx="12" cy="12" r="10" stroke-dasharray="2 3" />
                <path d="M12 2v2m0 16v2M2 12h2m16 0h2" stroke-linecap="round" />
            </svg>
        </div>
    </div>

    <!-- Заголовок -->
    <h1 class="hero-title">Kinematics Lab</h1>

    <!-- Описание проекта -->
    <p class="hero-description">
        Интерактивные физические симуляции для изучения относительного движения, вертикальных запусков и принципов кинематики.
        Настраивайте параметры в реальном времени и визуализируйте результаты с помощью динамических анимаций и графиков.
    </p>

    <!-- Кнопка призыва к действию -->
    <a href="/about" class="hero-button">
        Начать эксперименты
        <svg class="hero-button-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M5 12h14"/>
            <path d="m12 5 7 7-7 7"/>
        </svg>
    </a>
</section>
