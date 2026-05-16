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
