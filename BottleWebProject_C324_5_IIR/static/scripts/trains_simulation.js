// Симуляция встречного движения поездов

document.addEventListener('DOMContentLoaded', function() {
    // Получаем элементы
    const train1SpeedSlider = document.getElementById('train1-speed');
    const train2SpeedSlider = document.getElementById('train2-speed');
    const train1LengthSlider = document.getElementById('train1-length');
    const train2LengthSlider = document.getElementById('train2-length');

    const train1SpeedValue = document.getElementById('train1-speed-value');
    const train2SpeedValue = document.getElementById('train2-speed-value');
    const train1LengthValue = document.getElementById('train1-length-value');
    const train2LengthValue = document.getElementById('train2-length-value');

    const meetingTimeEl = document.getElementById('meeting-time');
    const distance1El = document.getElementById('distance1');
    const distance2El = document.getElementById('distance2');

    const simulateBtn = document.getElementById('simulate-btn');

    // Проверяем, что все элементы существуют
    if (!train1SpeedSlider || !train2SpeedSlider || !train1LengthSlider || !train2LengthSlider) {
        return; // Выходим, если мы не на странице с симуляцией поездов
    }

    // Функция расчета результатов
    function calculateResults() {
        const v1 = parseFloat(train1SpeedSlider.value);
        const v2 = parseFloat(train2SpeedSlider.value);
        const L1 = parseFloat(train1LengthSlider.value);
        const L2 = parseFloat(train2LengthSlider.value);

        // Время встречи: t = (L1 + L2) / (v1 + v2)
        const meetingTime = (L1 + L2) / (v1 + v2);

        // Расстояния, пройденные каждым поездом
        const distance1 = v1 * meetingTime;
        const distance2 = v2 * meetingTime;

        // Обновляем отображение результатов
        meetingTimeEl.textContent = meetingTime.toFixed(2) + ' с';
        distance1El.textContent = distance1.toFixed(2) + ' м';
        distance2El.textContent = distance2.toFixed(2) + ' м';
    }

    // Обработчики изменения слайдеров
    train1SpeedSlider.addEventListener('input', function() {
        train1SpeedValue.textContent = this.value;
        calculateResults();
    });

    train2SpeedSlider.addEventListener('input', function() {
        train2SpeedValue.textContent = this.value;
        calculateResults();
    });

    train1LengthSlider.addEventListener('input', function() {
        train1LengthValue.textContent = this.value;
        calculateResults();
    });

    train2LengthSlider.addEventListener('input', function() {
        train2LengthValue.textContent = this.value;
        calculateResults();
    });

    // Обработчик кнопки симуляции
    simulateBtn.addEventListener('click', function() {
        // Здесь будет запуск анимации
        alert('Анимация будет реализована позже. Пока что вы можете наблюдать изменение результатов при настройке параметров.');
    });

    // Инициализация: рассчитываем результаты при загрузке страницы
    calculateResults();
});
