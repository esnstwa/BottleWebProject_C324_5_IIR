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
        <div class="river-simulation-grid">
            <div class="river-params-panel">
                <h3 class="panel-title">Параметры переправы через реку</h3>

                <div class="params-container">
                    <div class="param-group">
                        <label class="param-label">
                            Скорость катера v₁: <span id="river-boat-speed-value">5.0</span> м/с
                        </label>
                        <input type="range" id="river-boat-speed" class="param-slider river-slider"
                               min="0.1" max="15" step="0.1" value="5">
                    </div>

                    <div class="param-group">
                        <label class="param-label">
                            Скорость течения v₂: <span id="river-current-speed-value">2.0</span> м/с
                        </label>
                        <input type="range" id="river-current-speed" class="param-slider river-slider"
                               min="0" max="10" step="0.1" value="2">
                    </div>

                    <div class="param-group">
                        <label class="param-label">
                            Ширина реки L: <span id="river-width-value">100.0</span> м
                        </label>
                        <input type="range" id="river-width" class="param-slider river-slider"
                               min="10" max="300" step="0.1" value="100">
                    </div>

                    <button id="river-simulate-btn" class="simulate-button">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polygon points="5 3 19 12 5 21 5 3"/>
                        </svg>
                        Запустить симуляцию
                    </button>

                    <div class="theory-box">
                        <h4 class="theory-title">Теория:</h4>
                        <p class="theory-formula">t = L / v₁</p>
                        <p class="theory-formula">S = v₂ × t</p>
                        <p class="theory-text">Катер держит курс перпендикулярно берегу, а течение сносит его вниз по реке.</p>
                    </div>

                    <div class="results-box">
                        <h4 class="results-title">Результаты:</h4>
                        <p class="result-item">Время переправы: <strong id="river-crossing-time">20.00 с</strong></p>
                        <p class="result-item">Смещение по течению: <strong id="river-drift">40.00 м</strong></p>
                        <p class="result-item">Итоговая скорость: <strong id="river-result-speed">5.39 м/с</strong></p>
                    </div>
                </div>
            </div>

            <div class="river-visualization-panel">
                <div class="visualization-header">
                    <h3 class="panel-title">Визуализация</h3>
                    <button id="river-download-btn" class="download-button" title="Скачать">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
                            <polyline points="7 10 12 15 17 10"/>
                            <line x1="12" y1="15" x2="12" y2="3"/>
                        </svg>
                    </button>
                </div>
                <div class="river-canvas-container">
                    <div class="river-static-diagram" aria-label="Схема переправы катера через реку">
                        <svg viewBox="0 0 640 420" role="img">
                            <rect x="0" y="0" width="640" height="420" class="river-bank"/>
                            <rect x="0" y="76" width="640" height="268" class="river-water"/>
                            <path d="M0 118 C130 92 235 145 360 118 S530 96 640 122" class="river-wave"/>
                            <path d="M0 205 C120 178 260 228 386 202 S540 176 640 205" class="river-wave"/>
                            <path d="M0 292 C132 320 246 268 372 292 S535 316 640 286" class="river-wave"/>

                            <line x1="86" y1="344" x2="86" y2="76" class="river-measure"/>
                            <line x1="67" y1="76" x2="105" y2="76" class="river-measure"/>
                            <line x1="67" y1="344" x2="105" y2="344" class="river-measure"/>
                            <text x="36" y="218" class="river-label-dark">L</text>

                            <line x1="190" y1="314" x2="190" y2="135" class="river-guide"/>
                            <line x1="190" y1="314" x2="430" y2="135" class="river-path"/>

                            <g class="river-boat" transform="translate(190 314)">
                                <path d="M-42 -8 H42 L25 20 H-27 Z"/>
                                <rect x="-13" y="-28" width="26" height="20"/>
                            </g>

                            <line x1="190" y1="314" x2="190" y2="210" class="river-arrow-main"/>
                            <path d="M190 210 L178 232 M190 210 L202 232" class="river-arrow-head-main"/>
                            <text x="210" y="260" class="river-label-light">v₁</text>

                            <line x1="220" y1="333" x2="350" y2="333" class="river-arrow-light"/>
                            <path d="M350 333 L328 321 M350 333 L328 345" class="river-arrow-head-light"/>
                            <text x="272" y="366" class="river-label-light">v₂</text>

                            <line x1="190" y1="112" x2="430" y2="112" class="river-arrow-main thin"/>
                            <path d="M430 112 L408 100 M430 112 L408 124" class="river-arrow-head-main"/>
                            <text x="302" y="96" class="river-label-light">S</text>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Вкладка: Вертикальный запуск -->
    % elif simulation == 'launch':
    <div class="tab-content active">
        <style>
        .launch-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            padding: 20px;
        }

        .launch-panel {
            background: rgba(233, 190, 95, 0.2);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 24px;
            border: 1px solid rgba(233, 190, 95, 0.3);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }

        .launch-panel:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.12);
            border-color: rgba(233, 190, 95, 0.5);
        }

        .launch-panel h3 {
            color: #282823;
            font-size: 24px;
            font-weight: 600;
            margin: 0 0 24px 0;
        }

        .launch-slider-group {
            margin-bottom: 24px;
            overflow-x: visible;
        }

        .launch-slider-label {
            color: #282823;
            font-size: 14px;
            font-weight: 500;
            display: block;
            margin-bottom: 12px;
        }

        .launch-slider-wrapper {
            position: relative;
            width: 100%;
            padding: 8px 0;
            overflow-x: visible;
            display: block;
        }

        .launch-slider {
            width: 100%;
            max-width: 100%;
            height: 6px;
            background: #595C56;
            outline: none;
            -webkit-appearance: none;
            appearance: none;
            border-radius: 3px;
            cursor: pointer;
            background: linear-gradient(to right, #E9BE5F 0%, #E9BE5F 33.33%, #595C56 33.33%, #595C56 100%);
            display: block;
            box-sizing: border-box;
        }

        .launch-slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #E9BE5F;
            cursor: pointer;
            border: 3px solid #282823;
            transition: background 0.3s ease, transform 0.3s ease;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
        }

        .launch-slider::-webkit-slider-thumb:hover {
            background: #F5E8B6;
            transform: scale(1.15);
        }

        .launch-slider::-moz-range-thumb {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background: #E9BE5F;
            cursor: pointer;
            border: 3px solid #282823;
            transition: background 0.3s ease, transform 0.3s ease;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
        }

        .launch-slider::-moz-range-thumb:hover {
            background: #F5E8B6;
            transform: scale(1.15);
        }

        .launch-slider::-moz-range-progress {
            background: #E9BE5F;
            height: 6px;
            border-radius: 3px;
        }

        .launch-slider::-moz-range-track {
            background: #595C56;
            height: 6px;
            border-radius: 3px;
        }

        .launch-btn {
            width: 100%;
            background: #E9BE5F;
            color: #282823;
            padding: 12px 24px;
            border-radius: 12px;
            border: none;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .launch-btn:hover {
            background: #F5E8B6;
            transform: translateY(-2px);
        }

        .launch-theory {
            background: #282823;
            color: #F5E8B6;
            padding: 16px;
            border-radius: 12px;
            margin-top: 24px;
        }

        .launch-theory h4 {
            color: #F5E8B6;
            font-size: 14px;
            font-weight: 600;
            margin: 0 0 12px 0;
        }

        .launch-theory p {
            font-size: 14px;
            margin: 0 0 8px 0;
            opacity: 0.9;
        }

        .launch-theory p:last-child {
            margin-bottom: 0;
        }

        .launch-results {
            background: #E9BE5F;
            color: #282823;
            padding: 16px;
            border-radius: 12px;
            margin-top: 16px;
        }

        .launch-results h4 {
            color: #282823;
            font-size: 14px;
            font-weight: 600;
            margin: 0 0 12px 0;
        }

        .launch-results p {
            font-size: 14px;
            margin: 0 0 8px 0;
        }

        .launch-results p:last-child {
            margin-bottom: 0;
        }

        .launch-results strong {
            font-weight: 700;
        }

        .launch-canvas-wrapper {
            background: #282823;
            border-radius: 12px;
            overflow: hidden;
            margin-bottom: 16px;
        }

        .launch-canvas {
            width: 100%;
            height: 250px;
            display: block;
        }

        .launch-right-column {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .launch-panel-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 16px;
        }

        .launch-panel-header h3 {
            margin: 0;
        }

        .launch-download-btn {
            background: transparent;
            border: none;
            color: #595C56;
            cursor: pointer;
            padding: 4px;
            transition: color 0.3s ease;
        }

        .launch-download-btn:hover {
            color: #282823;
        }

        @media (max-width: 1024px) {
            .launch-grid {
                grid-template-columns: 1fr;
            }
        }

        .launch-info-panel {
            background: rgba(233, 190, 95, 0.3);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 24px;
            border: 1px solid rgba(233, 190, 95, 0.4);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            margin-bottom: 24px;
        }

        .launch-info-header {
            display: flex;
            align-items: start;
            gap: 12px;
            margin-bottom: 16px;
        }

        .launch-info-icon {
            width: 24px;
            height: 24px;
            color: #E9BE5F;
            flex-shrink: 0;
            margin-top: 4px;
        }

        .launch-info-content h2 {
            color: #282823;
            font-size: 20px;
            font-weight: 600;
            margin: 0 0 12px 0;
        }

        .launch-info-content p {
            color: #282823;
            margin-bottom: 12px;
            line-height: 1.6;
        }

        .launch-info-content p:last-of-type {
            color: #595C56;
            margin-bottom: 16px;
        }

        .launch-info-content strong {
            font-weight: 600;
        }

        .launch-warning {
            background: #282823;
            color: #F5E8B6;
            padding: 16px;
            border-radius: 12px;
            display: flex;
            align-items: start;
            gap: 12px;
        }

        .launch-warning-icon {
            width: 20px;
            height: 20px;
            color: #E9BE5F;
            flex-shrink: 0;
            margin-top: 2px;
        }

        .launch-warning strong {
            color: #E9BE5F;
        }
        </style>

        <div class="launch-info-panel">
            <div class="launch-info-header">
                <svg class="launch-info-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="12" r="10"></circle>
                    <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                    <line x1="12" y1="17" x2="12.01" y2="17"></line>
                </svg>
                <div class="launch-info-content">
                    <h2>Что такое вертикальный запуск?</h2>
                    <p>
                        Когда вы бросаете мяч прямо вверх, он замедляется по мере подъёма, останавливается на мгновение в верхней точке,
                        а затем ускоряется при падении обратно вниз. Эта симуляция показывает, как высоко он поднимется и сколько времени
                        потребуется, чтобы вернуться вниз.
                    </p>
                    <p>
                        <strong>Аналогия из жизни:</strong> Это как подбрасывать баскетбольный мяч прямо вверх в парке — чем сильнее вы его бросите,
                        тем выше он поднимется и тем дольше вам придётся ждать, пока он вернётся обратно!
                    </p>
                    <div class="launch-warning">
                        <svg class="launch-warning-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
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
            </div>
        </div>

        <div class="launch-grid">
            <!-- Левая колонка: Параметры -->
            <div class="launch-panel">
                <h3>Параметры вертикального запуска</h3>

                <div class="launch-slider-group">
                    <label class="launch-slider-label">
                        Начальная скорость: <span id="velocityValue">20.0</span> м/с
                    </label>
                    <div class="launch-slider-wrapper">
                        <input type="range" class="launch-slider" id="velocitySlider" min="5" max="50" step="0.1" value="20">
                    </div>
                </div>

                <div class="launch-slider-group">
                    <label class="launch-slider-label">
                        Начальная высота: <span id="heightValue">10.0</span> м
                    </label>
                    <div class="launch-slider-wrapper">
                        <input type="range" class="launch-slider" id="heightSlider" min="0" max="50" step="0.1" value="10">
                    </div>
                </div>

                <button class="launch-btn">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="5 3 19 12 5 21 5 3"></polygon>
                    </svg>
                    Запустить симуляцию
                </button>

                <div class="launch-theory">
                    <h4>Теория:</h4>
                    <p>h(t) = h₀ + v₀t - ½gt²</p>
                    <p>v(t) = v₀ - gt</p>
                    <p>h_max = h₀ + v₀²/2g</p>
                </div>

                <div class="launch-results">
                    <h4>Результаты:</h4>
                    <p>Максимальная высота: <strong>30.39 м</strong></p>
                    <p>Время до апогея: <strong>2.04 с</strong></p>
                    <p>Общее время полета: <strong>4.59 с</strong></p>
                </div>
            </div>

            <!-- Правая колонка: Анимация и график -->
            <div class="launch-right-column">
                <div class="launch-panel">
                    <div class="launch-panel-header">
                        <h3>Анимация</h3>
                        <button class="launch-download-btn">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                <polyline points="7 10 12 15 17 10"></polyline>
                                <line x1="12" y1="15" x2="12" y2="3"></line>
                            </svg>
                        </button>
                    </div>
                    <div class="launch-canvas-wrapper">
                        <canvas class="launch-canvas" id="animationCanvas"></canvas>
                    </div>
                </div>

                <div class="launch-panel">
                    <h3>График высоты от времени</h3>
                    <div class="launch-canvas-wrapper">
                        <canvas class="launch-canvas" id="graphCanvas"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <script>
        // Обновление значений слайдеров
        const velocitySlider = document.getElementById('velocitySlider');
        const heightSlider = document.getElementById('heightSlider');
        const velocityValue = document.getElementById('velocityValue');
        const heightValue = document.getElementById('heightValue');

        function updateSliderValue(slider, valueDisplay) {
            const value = parseFloat(slider.value);
            valueDisplay.textContent = value.toFixed(1);

            // Обновляем gradient для визуализации
            const min = parseFloat(slider.min);
            const max = parseFloat(slider.max);
            const percentage = ((value - min) / (max - min)) * 100;

            slider.style.background = `linear-gradient(to right, #E9BE5F 0%, #E9BE5F ${percentage}%, #595C56 ${percentage}%, #595C56 100%)`;
        }

        // Инициализация при загрузке
        window.addEventListener('load', function() {
            updateSliderValue(velocitySlider, velocityValue);
            updateSliderValue(heightSlider, heightValue);
        });

        velocitySlider.addEventListener('input', function() {
            updateSliderValue(velocitySlider, velocityValue);
        });

        heightSlider.addEventListener('input', function() {
            updateSliderValue(heightSlider, heightValue);
        });
        </script>
    </div>
    <!-- Вкладка: Встреча поездов -->
    % elif simulation == 'trains':
    <div class="tab-content active">
        <div class="trains-simulation-grid">
            <!-- Левая панель: параметры и результаты -->
            <div class="trains-params-panel">
                <h3 class="panel-title">Параметры встречи поездов</h3>

                <div class="params-container">
                    <!-- Скорость первого поезда -->
                    <div class="param-group">
                        <label class="param-label">
                            Скорость поезда 1: <span id="train1-speed-value">20</span> м/с
                        </label>
                        <input type="range" id="train1-speed" class="param-slider"
                               min="10" max="40" step="1" value="20">
                    </div>

                    <!-- Скорость второго поезда -->
                    <div class="param-group">
                        <label class="param-label">
                            Скорость поезда 2: <span id="train2-speed-value">25</span> м/с
                        </label>
                        <input type="range" id="train2-speed" class="param-slider"
                               min="10" max="40" step="1" value="25">
                    </div>

                    <!-- Длина первого поезда -->
                    <div class="param-group">
                        <label class="param-label">
                            Длина поезда 1: <span id="train1-length-value">150</span> м
                        </label>
                        <input type="range" id="train1-length" class="param-slider"
                               min="50" max="300" step="10" value="150">
                    </div>

                    <!-- Длина второго поезда -->
                    <div class="param-group">
                        <label class="param-label">
                            Длина поезда 2: <span id="train2-length-value">200</span> м
                        </label>
                        <input type="range" id="train2-length" class="param-slider"
                               min="50" max="300" step="10" value="200">
                    </div>

                    <!-- Кнопка запуска симуляции -->
                    <button id="simulate-btn" class="simulate-button">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polygon points="5 3 19 12 5 21 5 3"/>
                        </svg>
                        Запустить симуляцию
                    </button>

                    <!-- Теоретическая справка -->
                    <div class="theory-box">
                        <h4 class="theory-title">Теория:</h4>
                        <p class="theory-formula">t = (L₁ + L₂) / (v₁ + v₂)</p>
                        <p class="theory-text">Относительная скорость: v<sub>отн</sub> = v₁ + v₂</p>
                    </div>

                    <!-- Результаты расчетов -->
                    <div class="results-box">
                        <h4 class="results-title">Результаты:</h4>
                        <p class="result-item">Время встречи: <strong id="meeting-time">7.78 с</strong></p>
                        <p class="result-item">Расстояние поезда 1: <strong id="distance1">155.56 м</strong></p>
                        <p class="result-item">Расстояние поезда 2: <strong id="distance2">194.44 м</strong></p>
                    </div>
                </div>
            </div>

            <!-- Правая панель: визуализация -->
            <div class="trains-visualization-panel">
                <div class="visualization-header">
                    <h3 class="panel-title">Визуализация</h3>
                    <button class="download-button" title="Скачать">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
                            <polyline points="7 10 12 15 17 10"/>
                            <line x1="12" y1="15" x2="12" y2="3"/>
                        </svg>
                    </button>
                </div>
                <div class="canvas-container">
                    <canvas id="trains-canvas" class="trains-canvas"></canvas>
                    <div class="canvas-placeholder">
                        <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                            <rect width="16" height="16" x="4" y="3" rx="2"/>
                            <path d="M4 11h16"/>
                            <path d="M12 3v8"/>
                            <path d="m8 19-2 3"/>
                            <path d="m18 22-2-3"/>
                            <path d="M8 15h0"/>
                            <path d="M16 15h0"/>
                        </svg>
                        <p>Здесь будет анимация встречного движения поездов</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    % end
</div>
