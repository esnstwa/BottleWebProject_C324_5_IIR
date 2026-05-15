% rebase('layout.tpl', title='Симуляции', year=year)

<!-- Заголовок страницы -->
<div class="simulations-header">
    <h1>Интерактивные симуляции</h1>
    <p>Выберите симуляцию ниже, чтобы изучить принципы кинематики. Настраивайте параметры и наблюдайте результаты в реальном времени.</p>
</div>

<!-- Контейнер с вкладками симуляций -->
<div class="tabs-container">
    <!-- Навигация между симуляциями -->
    <div class="tabs-list">
        <!-- Вкладка: Переправа через реку -->
        <a href="/simulations/river" class="tab-button {{'active' if simulation == 'river' else ''}}">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M2 6c.6.5 1.2 1 2.5 1C7 7 7 5 9.5 5c2.6 0 2.4 2 5 2 2.5 0 2.5-2 5-2 1.3 0 1.9.5 2.5 1"/>
                <path d="M2 12c.6.5 1.2 1 2.5 1 2.5 0 2.5-2 5-2 2.6 0 2.4 2 5 2 2.5 0 2.5-2 5-2 1.3 0 1.9.5 2.5 1"/>
                <path d="M2 18c.6.5 1.2 1 2.5 1 2.5 0 2.5-2 5-2 2.6 0 2.4 2 5 2 2.5 0 2.5-2 5-2 1.3 0 1.9.5 2.5 1"/>
            </svg>
            Переправа через реку
        </a>

        <!-- Вкладка: Вертикальный запуск -->
        <a href="/simulations/launch" class="tab-button {{'active' if simulation == 'launch' else ''}}">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M4.5 16.5c-1.5 1.26-2 5-2 5s3.74-.5 5-2c.71-.84.7-2.13-.09-2.91a2.18 2.18 0 0 0-2.91-.09z"/>
                <path d="m12 15-3-3a22 22 0 0 1 2-3.95A12.88 12.88 0 0 1 22 2c0 2.72-.78 7.5-6 11a22.35 22.35 0 0 1-4 2z"/>
                <path d="M9 12H4s.55-3.03 2-4c1.62-1.08 5 0 5 0"/>
                <path d="M12 15v5s3.03-.55 4-2c1.08-1.62 0-5 0-5"/>
            </svg>
            Вертикальный запуск
        </a>

        <!-- Вкладка: Встреча поездов -->
        <a href="/simulations/trains" class="tab-button {{'active' if simulation == 'trains' else ''}}">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <rect width="16" height="16" x="4" y="3" rx="2"/>
                <path d="M4 11h16"/>
                <path d="M12 3v8"/>
                <path d="m8 19-2 3"/>
                <path d="m18 22-2-3"/>
                <path d="M8 15h0"/>
                <path d="M16 15h0"/>
            </svg>
            Встреча поездов
        </a>
    </div>

    <!-- Содержимое симуляций (отображается в зависимости от выбранной вкладки) -->

    <!-- Вкладка: Переправа через реку -->
    % if simulation == 'river':
    <div class="tab-content active">
        <div class="simulation-placeholder">
            <h2>Симуляция переправы через реку</h2>
            <p>Содержимое симуляции будет реализовано здесь</p>
        </div>
    </div>
    <!-- Вкладка: Вертикальный запуск -->
    % elif simulation == 'launch':
    <div class="tab-content active">
        <div class="simulation-placeholder">
            <h2>Симуляция вертикального запуска</h2>
            <p>Содержимое симуляции будет реализовано здесь</p>
        </div>
    </div>
    <!-- Вкладка: Встреча поездов -->
    % elif simulation == 'trains':
    <div class="tab-content active">
        <div class="simulation-placeholder">
            <h2>Симуляция встречи поездов</h2>
            <p>Содержимое симуляции будет реализовано здесь</p>
        </div>
    </div>
    % end
</div>
