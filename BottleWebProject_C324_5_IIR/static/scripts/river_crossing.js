// Обновление значений слайдеров для переправы через реку
const riverBoatSpeedSlider = document.getElementById('riverBoatSpeedSlider');
const riverCurrentSpeedSlider = document.getElementById('riverCurrentSpeedSlider');
const riverWidthSlider = document.getElementById('riverWidthSlider');

const riverBoatSpeedValue = document.getElementById('riverBoatSpeedValue');
const riverCurrentSpeedValue = document.getElementById('riverCurrentSpeedValue');
const riverWidthValue = document.getElementById('riverWidthValue');

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
    if (riverBoatSpeedSlider) {
        updateSliderValue(riverBoatSpeedSlider, riverBoatSpeedValue);
        updateSliderValue(riverCurrentSpeedSlider, riverCurrentSpeedValue);
        updateSliderValue(riverWidthSlider, riverWidthValue);
    }
});

// Обработчики слайдеров
if (riverBoatSpeedSlider) {
    riverBoatSpeedSlider.addEventListener('input', function() {
        updateSliderValue(riverBoatSpeedSlider, riverBoatSpeedValue);
    });

    riverCurrentSpeedSlider.addEventListener('input', function() {
        updateSliderValue(riverCurrentSpeedSlider, riverCurrentSpeedValue);
    });

    riverWidthSlider.addEventListener('input', function() {
        updateSliderValue(riverWidthSlider, riverWidthValue);
    });
}
