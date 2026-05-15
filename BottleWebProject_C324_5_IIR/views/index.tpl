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
    <a href="/simulations" class="hero-button">
        Начать эксперименты
        <svg class="hero-button-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M5 12h14"/>
            <path d="m12 5 7 7-7 7"/>
        </svg>
    </a>
</section>

<!-- Секция с доступными симуляциями -->
<section class="simulations-section">
    <h2 class="simulations-title">Доступные симуляции</h2>

    <div class="simulations-grid">
        <!-- Переправа через реку -->
        <a href="/simulations/river" class="simulation-card">
            <div class="simulation-icon-wrapper">
                <svg class="simulation-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M2 6c.6.5 1.2 1 2.5 1C7 7 7 5 9.5 5c2.6 0 2.4 2 5 2 2.5 0 2.5-2 5-2 1.3 0 1.9.5 2.5 1"/>
                    <path d="M2 12c.6.5 1.2 1 2.5 1 2.5 0 2.5-2 5-2 2.6 0 2.4 2 5 2 2.5 0 2.5-2 5-2 1.3 0 1.9.5 2.5 1"/>
                    <path d="M2 18c.6.5 1.2 1 2.5 1 2.5 0 2.5-2 5-2 2.6 0 2.4 2 5 2 2.5 0 2.5-2 5-2 1.3 0 1.9.5 2.5 1"/>
                </svg>
            </div>
            <h3>Переправа через реку</h3>
            <p>Исследуйте, как лодка пересекает реку с перпендикулярной скоростью, будучи снесённой вниз по течению.</p>
            <div class="simulation-formula">t = L / v_лодка</div>
            <div class="simulation-explore">
                <span>Исследовать симуляцию</span>
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M5 12h14"/>
                    <path d="m12 5 7 7-7 7"/>
                </svg>
            </div>
        </a>

        <!-- Вертикальный запуск -->
        <a href="/simulations/launch" class="simulation-card">
            <div class="simulation-icon-wrapper">
                <svg class="simulation-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M4.5 16.5c-1.5 1.26-2 5-2 5s3.74-.5 5-2c.71-.84.7-2.13-.09-2.91a2.18 2.18 0 0 0-2.91-.09z"/>
                    <path d="m12 15-3-3a22 22 0 0 1 2-3.95A12.88 12.88 0 0 1 22 2c0 2.72-.78 7.5-6 11a22.35 22.35 0 0 1-4 2z"/>
                    <path d="M9 12H4s.55-3.03 2-4c1.62-1.08 5 0 5 0"/>
                    <path d="M12 15v5s3.03-.55 4-2c1.08-1.62 0-5 0-5"/>
                </svg>
            </div>
            <h3>Вертикальный запуск</h3>
            <p>Изучите движение снаряда с начальной скоростью вверх, рассчитайте максимальную высоту и время полёта.</p>
            <div class="simulation-formula">h_max = h₀ + v₀²/2g</div>
            <div class="simulation-explore">
                <span>Исследовать симуляцию</span>
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M5 12h14"/>
                    <path d="m12 5 7 7-7 7"/>
                </svg>
            </div>
        </a>

        <!-- Встреча поездов -->
        <a href="/simulations/trains" class="simulation-card">
            <div class="simulation-icon-wrapper">
                <svg class="simulation-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <rect width="16" height="16" x="4" y="3" rx="2"/>
                    <path d="M4 11h16"/>
                    <path d="M12 3v8"/>
                    <path d="m8 19-2 3"/>
                    <path d="m18 22-2-3"/>
                    <path d="M8 15h0"/>
                    <path d="M16 15h0"/>
                </svg>
            </div>
            <h3>Встреча поездов</h3>
            <p>Проанализируйте два поезда, движущихся навстречу друг другу по параллельным путям, и рассчитайте, когда они встретятся.</p>
            <div class="simulation-formula">t = (L₁ + L₂) / (v₁ + v₂)</div>
            <div class="simulation-explore">
                <span>Исследовать симуляцию</span>
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M5 12h14"/>
                    <path d="m12 5 7 7-7 7"/>
                </svg>
            </div>
        </a>
    </div>
</section>

<!-- Секция О проекте -->
<section class="about-lab-section">
    <div class="about-lab-container">
        <h2 class="about-lab-title">О проекте</h2>
        <div class="about-lab-content">
            <p>
                <strong>Kinematics Lab</strong> — интерактивная платформа для изучения физических законов кинематики
                через визуальные симуляции и расчёты. Проект разработан в рамках учебной практики УП02_324.
            </p>
            <p>
                Python модуль для расчёта и построения графиков вертикального движения тела, брошенного вверх.
                Платформа включает модули для расчёта и визуализации различных типов движения: вертикальное движение тела,
                переправа через реку, встреча движущихся объектов и другие задачи кинематики.
            </p>
        </div>
    </div>
</section>
