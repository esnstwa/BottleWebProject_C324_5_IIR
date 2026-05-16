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
        <div class="sim-intro">
            <h2>Что такое переправа через реку?</h2>
            <p>
                Когда катер пересекает реку с течением, его фактическая траектория отличается от направления движения.
                Эта симуляция показывает, как течение влияет на путь катера и на какое расстояние его снесет вниз по реке.
            </p>
            <div class="sim-warning">
                <svg class="sim-warning-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"></path>
                    <line x1="12" y1="9" x2="12" y2="13"></line>
                    <line x1="12" y1="17" x2="12.01" y2="17"></line>
                </svg>
                <div>
                    <strong>Распространённая ошибка:</strong> Многие думают, что катер движется по прямой линии перпендикулярно берегу.
                    Неправильно! Течение постоянно сносит катер вниз по реке, поэтому реальная траектория — это диагональная линия.
                </div>
            </div>
        </div>

        <div class="sim-grid">
            <!-- Левая колонка: Параметры -->
            <div class="sim-panel">
                <h3>Параметры переправы через реку</h3>

                <div class="sim-slider-group">
                    <div class="sim-slider-label">
                        <span>Скорость катера v₁: <span id="riverBoatSpeedValue">5.0</span> м/с</span>
                        <button class="tooltip-trigger" data-tooltip="river-boat-speed-tooltip">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-slider-wrapper">
                        <input type="range" class="sim-slider" id="riverBoatSpeedSlider" min="0.1" max="15" step="0.1" value="5">
                    </div>
                </div>

                <div class="sim-slider-group">
                    <div class="sim-slider-label">
                        <span>Скорость течения v₂: <span id="riverCurrentSpeedValue">2.0</span> м/с</span>
                        <button class="tooltip-trigger" data-tooltip="river-current-speed-tooltip">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-slider-wrapper">
                        <input type="range" class="sim-slider" id="riverCurrentSpeedSlider" min="0" max="10" step="0.1" value="2">
                    </div>
                </div>

                <div class="sim-slider-group">
                    <div class="sim-slider-label">
                        <span>Ширина реки L: <span id="riverWidthValue">100.0</span> м</span>
                        <button class="tooltip-trigger" data-tooltip="river-width-tooltip">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-slider-wrapper">
                        <input type="range" class="sim-slider" id="riverWidthSlider" min="10" max="300" step="0.1" value="100">
                    </div>
                </div>

                <button class="sim-btn" id="riverSimulateBtn">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="5 3 19 12 5 21 5 3"></polygon>
                    </svg>
                    Запустить симуляцию
                </button>

                <div class="sim-theory">
                    <h4>Теория:</h4>
                    <p>t = L / v₁</p>
                    <p>S = v₂ × t</p>
                    <p>v_рез = √(v₁² + v₂²)</p>
                </div>

                <div class="sim-results">
                    <h4>Результаты:</h4>
                    <p>Время переправы: <strong id="riverCrossingTime">20.00 с</strong></p>
                    <p>Смещение по течению: <strong id="riverDrift">40.00 м</strong></p>
                    <p>Итоговая скорость: <strong id="riverResultSpeed">5.39 м/с</strong></p>
                </div>
            </div>

            <!-- Правая колонка: Визуализация -->
            <div class="sim-right-column">
                <div class="sim-panel">
                    <div class="sim-panel-header">
                        <h3>Визуализация</h3>
                        <button class="sim-download-btn" id="riverDownloadBtn">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                <polyline points="7 10 12 15 17 10"></polyline>
                                <line x1="12" y1="15" x2="12" y2="3"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-canvas-wrapper">
                        <canvas class="sim-canvas" id="riverCanvas" style="height: 500px;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tooltip контент для переправы через реку -->
        <div class="tooltip-content" id="river-boat-speed-tooltip">
            <div class="tooltip-arrow"></div>
            <div class="tooltip-section">
                <h4>Что это означает:</h4>
                <p>Скорость катера — это скорость, с которой катер движется относительно воды. Измеряется в метрах в секунду (м/с).</p>
            </div>
            <div class="tooltip-section">
                <h4>Что происходит при изменении:</h4>
                <p>Чем выше скорость катера, тем быстрее он пересечет реку, но течение все равно будет сносить его вниз по реке.</p>
            </div>
            <div class="tooltip-section">
                <h4>Пример из жизни:</h4>
                <p>Моторная лодка обычно движется со скоростью 5-10 м/с (18-36 км/ч), а скоростной катер может развивать до 20 м/с (72 км/ч).</p>
            </div>
        </div>

        <div class="tooltip-content" id="river-current-speed-tooltip">
            <div class="tooltip-arrow"></div>
            <div class="tooltip-section">
                <h4>Что это означает:</h4>
                <p>Скорость течения — это скорость, с которой вода движется вниз по реке. Измеряется в метрах в секунду (м/с).</p>
            </div>
            <div class="tooltip-section">
                <h4>Что происходит при изменении:</h4>
                <p>Чем сильнее течение, тем больше катер будет снесен вниз по реке во время переправы. При очень сильном течении переправа может стать опасной.</p>
            </div>
            <div class="tooltip-section">
                <h4>Пример из жизни:</h4>
                <p>Спокойная река имеет течение 0.5-1 м/с, средняя река — 2-3 м/с, а горная река может иметь течение 5-10 м/с.</p>
            </div>
        </div>

        <div class="tooltip-content" id="river-width-tooltip">
            <div class="tooltip-arrow"></div>
            <div class="tooltip-section">
                <h4>Что это означает:</h4>
                <p>Ширина реки — это расстояние от одного берега до другого. Измеряется в метрах (м).</p>
            </div>
            <div class="tooltip-section">
                <h4>Что происходит при изменении:</h4>
                <p>Чем шире река, тем дольше будет длиться переправа и тем больше катер будет снесен течением вниз по реке.</p>
            </div>
            <div class="tooltip-section">
                <h4>Пример из жизни:</h4>
                <p>Небольшая река может быть шириной 50-100 метров, средняя река — 200-500 метров, а крупная река типа Волги — 1-2 километра.</p>
            </div>
        </div>
    </div>
    <!-- Вкладка: Вертикальный запуск -->
    % elif simulation == 'launch':
    <div class="tab-content active">
        <div class="sim-intro">
            <h2>Что такое вертикальный запуск?</h2>
            <p>
                Когда вы бросаете мяч прямо вверх, он замедляется по мере подъёма, останавливается на мгновение в верхней точке,
                а затем ускоряется при падении обратно вниз. Эта симуляция показывает, как высоко он поднимется и сколько времени
                потребуется, чтобы вернуться вниз.
            </p>
            <div class="sim-warning">
                <svg class="sim-warning-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"></path>
                    <line x1="12" y1="9" x2="12" y2="13"></line>
                    <line x1="12" y1="17" x2="12.01" y2="17"></line>
                </svg>
                <div>
                    <strong>Распространённая ошибка:</strong> Многие думают, что объект перестаёт ускоряться в верхней точке.
                    Неправильно! Гравитация никогда не прекращает действовать — она всегда ускоряет объект вниз со скоростью 9.81 м/с²,
                    даже в самой верхней точке, когда скорость равна нулю.
                </div>
            </div>
        </div>

        <div class="sim-grid">
            <!-- Левая колонка: Параметры -->
            <div class="sim-panel">
                <h3>Параметры вертикального запуска</h3>

                <div class="sim-slider-group">
                    <div class="sim-slider-label">
                        <span>Начальная скорость: <span id="velocityValue">20.0</span> м/с</span>
                        <button class="tooltip-trigger" data-tooltip="velocity-tooltip">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-slider-wrapper">
                        <input type="range" class="sim-slider" id="velocitySlider" min="5" max="50" step="0.1" value="20">
                    </div>
                </div>

                <div class="sim-slider-group">
                    <div class="sim-slider-label">
                        <span>Начальная высота: <span id="heightValue">10.0</span> м</span>
                        <button class="tooltip-trigger" data-tooltip="height-tooltip">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-slider-wrapper">
                        <input type="range" class="sim-slider" id="heightSlider" min="0" max="50" step="0.1" value="10">
                    </div>
                </div>

                <button class="sim-btn">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="5 3 19 12 5 21 5 3"></polygon>
                    </svg>
                    Запустить симуляцию
                </button>

                <div class="sim-theory">
                    <h4>Теория:</h4>
                    <p>h(t) = h₀ + v₀t - ½gt²</p>
                    <p>v(t) = v₀ - gt</p>
                    <p>h_max = h₀ + v₀²/2g</p>
                </div>

                <div class="sim-results">
                    <h4>Результаты:</h4>
                    <p>Максимальная высота: <strong>30.39 м</strong></p>
                    <p>Время до апогея: <strong>2.04 с</strong></p>
                    <p>Общее время полета: <strong>4.59 с</strong></p>
                </div>
            </div>

            <!-- Правая колонка: Анимация и график -->
            <div class="sim-right-column">
                <div class="sim-panel">
                    <div class="sim-panel-header">
                        <h3>Анимация</h3>
                        <button class="sim-download-btn">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                <polyline points="7 10 12 15 17 10"></polyline>
                                <line x1="12" y1="15" x2="12" y2="3"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-canvas-wrapper">
                        <canvas class="sim-canvas" id="animationCanvas"></canvas>
                    </div>
                </div>

                <div class="sim-panel">
                    <h3>График высоты от времени</h3>
                    <div class="sim-canvas-wrapper">
                        <canvas class="sim-canvas" id="graphCanvas"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tooltip контент вне всех контейнеров -->
        <div class="tooltip-content" id="velocity-tooltip">
            <div class="tooltip-arrow"></div>
            <div class="tooltip-section">
                <h4>Что это означает:</h4>
                <p>Начальная скорость — это скорость, с которой объект начинает движение вверх. Измеряется в метрах в секунду (м/с).</p>
            </div>
            <div class="tooltip-section">
                <h4>Что происходит при изменении:</h4>
                <p>Чем выше начальная скорость, тем выше поднимется объект и тем дольше он будет в воздухе. При удвоении скорости максимальная высота увеличивается в 4 раза.</p>
            </div>
            <div class="tooltip-section">
                <h4>Пример из жизни:</h4>
                <p>Если вы бросите мяч вверх со скоростью 20 м/с (примерно 72 км/ч), он поднимется примерно на 20 метров — это высота 6-этажного здания!</p>
            </div>
        </div>

        <div class="tooltip-content" id="height-tooltip">
            <div class="tooltip-arrow"></div>
            <div class="tooltip-section">
                <h4>Что это означает:</h4>
                <p>Начальная высота — это высота над землёй, с которой начинается бросок. Измеряется в метрах (м).</p>
            </div>
            <div class="tooltip-section">
                <h4>Что происходит при изменении:</h4>
                <p>Чем выше начальная точка, тем дольше объект будет падать и тем выше будет максимальная высота полёта. Это добавляет дополнительную потенциальную энергию.</p>
            </div>
            <div class="tooltip-section">
                <h4>Пример из жизни:</h4>
                <p>Если вы бросите мяч вверх с балкона 3-го этажа (около 10 метров), он поднимется выше и будет лететь дольше, чем если бы вы бросили его с земли с той же скоростью.</p>
            </div>
        </div>
    </div>
    <!-- Вкладка: Встреча поездов -->
    % elif simulation == 'trains':
    <div class="tab-content active">
        <div class="sim-intro">
            <h2>Что такое встреча поездов?</h2>
            <p>
                Когда два поезда движутся навстречу друг другу, они встречаются быстрее, чем если бы двигался только один.
                Эта симуляция показывает, через какое время они встретятся и какое расстояние пройдет каждый поезд.
            </p>
            <div class="sim-warning">
                <svg class="sim-warning-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"></path>
                    <line x1="12" y1="9" x2="12" y2="13"></line>
                    <line x1="12" y1="17" x2="12.01" y2="17"></line>
                </svg>
                <div>
                    <strong>Распространённая ошибка:</strong> Многие думают, что нужно учитывать только скорость одного поезда.
                    Неправильно! При встречном движении скорости складываются — относительная скорость равна сумме скоростей обоих поездов (v₁ + v₂).
                </div>
            </div>
        </div>

        <div class="sim-grid">
            <!-- Левая колонка: Параметры -->
            <div class="sim-panel">
                <h3>Параметры встречи поездов</h3>

                <div class="sim-slider-group">
                    <div class="sim-slider-label">
                        <span>Скорость поезда 1: <span id="train1SpeedValue">20.0</span> м/с</span>
                        <button class="tooltip-trigger" data-tooltip="train1-speed-tooltip">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-slider-wrapper">
                        <input type="range" class="sim-slider" id="train1SpeedSlider" min="10" max="40" step="0.1" value="20">
                    </div>
                </div>

                <div class="sim-slider-group">
                    <div class="sim-slider-label">
                        <span>Скорость поезда 2: <span id="train2SpeedValue">25.0</span> м/с</span>
                        <button class="tooltip-trigger" data-tooltip="train2-speed-tooltip">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-slider-wrapper">
                        <input type="range" class="sim-slider" id="train2SpeedSlider" min="10" max="40" step="0.1" value="25">
                    </div>
                </div>

                <div class="sim-slider-group">
                    <div class="sim-slider-label">
                        <span>Длина поезда 1: <span id="train1LengthValue">150.0</span> м</span>
                        <button class="tooltip-trigger" data-tooltip="train1-length-tooltip">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-slider-wrapper">
                        <input type="range" class="sim-slider" id="train1LengthSlider" min="50" max="300" step="0.1" value="150">
                    </div>
                </div>

                <div class="sim-slider-group">
                    <div class="sim-slider-label">
                        <span>Длина поезда 2: <span id="train2LengthValue">200.0</span> м</span>
                        <button class="tooltip-trigger" data-tooltip="train2-length-tooltip">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-slider-wrapper">
                        <input type="range" class="sim-slider" id="train2LengthSlider" min="50" max="300" step="0.1" value="200">
                    </div>
                </div>

                <button class="sim-btn" id="trainsSimulateBtn">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="5 3 19 12 5 21 5 3"></polygon>
                    </svg>
                    Запустить симуляцию
                </button>

                <div class="sim-theory">
                    <h4>Теория:</h4>
                    <p>t = (L₁ + L₂) / (v₁ + v₂)</p>
                    <p>v_отн = v₁ + v₂</p>
                </div>

                <div class="sim-results">
                    <h4>Результаты:</h4>
                    <p>Время встречи: <strong id="meetingTime">7.78 с</strong></p>
                    <p>Расстояние поезда 1: <strong id="distance1">155.56 м</strong></p>
                    <p>Расстояние поезда 2: <strong id="distance2">194.44 м</strong></p>
                </div>
            </div>

            <!-- Правая колонка: Визуализация -->
            <div class="sim-right-column">
                <div class="sim-panel">
                    <div class="sim-panel-header">
                        <h3>Визуализация</h3>
                        <button class="sim-download-btn" id="trainsDownloadBtn">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                <polyline points="7 10 12 15 17 10"></polyline>
                                <line x1="12" y1="15" x2="12" y2="3"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="sim-canvas-wrapper">
                        <canvas class="sim-canvas" id="trainsCanvas" style="height: 500px;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tooltip контент для встречи поездов -->
        <div class="tooltip-content" id="train1-speed-tooltip">
            <div class="tooltip-arrow"></div>
            <div class="tooltip-section">
                <h4>Что это означает:</h4>
                <p>Скорость первого поезда — это скорость, с которой он движется навстречу второму поезду. Измеряется в метрах в секунду (м/с).</p>
            </div>
            <div class="tooltip-section">
                <h4>Что происходит при изменении:</h4>
                <p>Чем выше скорость первого поезда, тем быстрее произойдет встреча и тем большее расстояние он пройдет до точки встречи.</p>
            </div>
            <div class="tooltip-section">
                <h4>Пример из жизни:</h4>
                <p>Если поезд движется со скоростью 20 м/с (72 км/ч), это типичная скорость пригородного поезда.</p>
            </div>
        </div>

        <div class="tooltip-content" id="train2-speed-tooltip">
            <div class="tooltip-arrow"></div>
            <div class="tooltip-section">
                <h4>Что это означает:</h4>
                <p>Скорость второго поезда — это скорость, с которой он движется навстречу первому поезду. Измеряется в метрах в секунду (м/с).</p>
            </div>
            <div class="tooltip-section">
                <h4>Что происходит при изменении:</h4>
                <p>Чем выше скорость второго поезда, тем быстрее произойдет встреча и тем большее расстояние он пройдет до точки встречи.</p>
            </div>
            <div class="tooltip-section">
                <h4>Пример из жизни:</h4>
                <p>Если поезд движется со скоростью 25 м/с (90 км/ч), это скорость скоростного пригородного поезда или электрички.</p>
            </div>
        </div>

        <div class="tooltip-content" id="train1-length-tooltip">
            <div class="tooltip-arrow"></div>
            <div class="tooltip-section">
                <h4>Что это означает:</h4>
                <p>Длина первого поезда — это расстояние от головы до хвоста поезда. Измеряется в метрах (м).</p>
            </div>
            <div class="tooltip-section">
                <h4>Что происходит при изменении:</h4>
                <p>Чем длиннее поезд, тем больше времени потребуется для полного разъезда поездов, так как нужно учесть длину обоих составов.</p>
            </div>
            <div class="tooltip-section">
                <h4>Пример из жизни:</h4>
                <p>Пригородная электричка обычно имеет длину 150-200 метров (10-12 вагонов), а грузовой поезд может достигать 1000 метров.</p>
            </div>
        </div>

        <div class="tooltip-content" id="train2-length-tooltip">
            <div class="tooltip-arrow"></div>
            <div class="tooltip-section">
                <h4>Что это означает:</h4>
                <p>Длина второго поезда — это расстояние от головы до хвоста поезда. Измеряется в метрах (м).</p>
            </div>
            <div class="tooltip-section">
                <h4>Что происходит при изменении:</h4>
                <p>Чем длиннее поезд, тем больше времени потребуется для полного разъезда поездов, так как нужно учесть длину обоих составов.</p>
            </div>
            <div class="tooltip-section">
                <h4>Пример из жизни:</h4>
                <p>Пассажирский поезд дальнего следования обычно имеет длину 200-300 метров (15-20 вагонов).</p>
            </div>
        </div>
    </div>
    % end
</div>
