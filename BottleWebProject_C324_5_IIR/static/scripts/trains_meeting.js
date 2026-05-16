// Обновление значений слайдеров для встречи поездов
const train1SpeedSlider = document.getElementById('train1SpeedSlider');
const train2SpeedSlider = document.getElementById('train2SpeedSlider');
const train1LengthSlider = document.getElementById('train1LengthSlider');
const train2LengthSlider = document.getElementById('train2LengthSlider');

const train1SpeedValue = document.getElementById('train1SpeedValue');
const train2SpeedValue = document.getElementById('train2SpeedValue');
const train1LengthValue = document.getElementById('train1LengthValue');
const train2LengthValue = document.getElementById('train2LengthValue');

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
    if (train1SpeedSlider) {
        updateSliderValue(train1SpeedSlider, train1SpeedValue);
        updateSliderValue(train2SpeedSlider, train2SpeedValue);
        updateSliderValue(train1LengthSlider, train1LengthValue);
        updateSliderValue(train2LengthSlider, train2LengthValue);
    }
});

// Обработчики слайдеров
if (train1SpeedSlider) {
    train1SpeedSlider.addEventListener('input', function() {
        updateSliderValue(train1SpeedSlider, train1SpeedValue);
    });

    train2SpeedSlider.addEventListener('input', function() {
        updateSliderValue(train2SpeedSlider, train2SpeedValue);
    });

    train1LengthSlider.addEventListener('input', function() {
        updateSliderValue(train1LengthSlider, train1LengthValue);
    });

    train2LengthSlider.addEventListener('input', function() {
        updateSliderValue(train2LengthSlider, train2LengthValue);
    });
}
