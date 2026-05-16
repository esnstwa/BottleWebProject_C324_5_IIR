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

// Tooltip функциональность
document.addEventListener('DOMContentLoaded', function() {
    const tooltipTriggers = document.querySelectorAll('.tooltip-trigger');

    tooltipTriggers.forEach(trigger => {
        const tooltipId = trigger.getAttribute('data-tooltip');
        const tooltip = document.getElementById(tooltipId);

        if (!tooltip) return;

        let hideTimeout;

        // Функция для позиционирования tooltip
        function positionTooltip() {
            const rect = trigger.getBoundingClientRect();

            // Позиционируем справа от иконки вопроса
            let left = rect.right + 10;
            let top = rect.top - 10;

            // Проверяем, не выходит ли tooltip за правый край экрана
            const tooltipWidth = 450;
            if (left + tooltipWidth > window.innerWidth - 20) {
                // Если выходит, показываем слева от иконки
                left = rect.left - tooltipWidth - 10;
            }

            // Проверяем, не выходит ли tooltip за левый край экрана
            if (left < 20) {
                left = 20;
            }

            // Проверяем, не выходит ли tooltip за нижний край экрана
            const tooltipHeight = tooltip.offsetHeight || 300;
            if (top + tooltipHeight > window.innerHeight - 20) {
                top = window.innerHeight - tooltipHeight - 20;
            }

            // Проверяем, не выходит ли tooltip за верхний край экрана
            if (top < 20) {
                top = 20;
            }

            tooltip.style.left = left + 'px';
            tooltip.style.top = top + 'px';
        }

        // Показать tooltip при наведении на кнопку
        trigger.addEventListener('mouseenter', function(e) {
            clearTimeout(hideTimeout);
            tooltip.classList.add('visible');
            positionTooltip();
        });

        // Скрыть tooltip при уходе с кнопки
        trigger.addEventListener('mouseleave', function() {
            hideTimeout = setTimeout(() => {
                tooltip.classList.remove('visible');
            }, 200);
        });

        // Оставить tooltip видимым при наведении на него
        tooltip.addEventListener('mouseenter', function() {
            clearTimeout(hideTimeout);
        });

        // Скрыть tooltip при уходе с него
        tooltip.addEventListener('mouseleave', function() {
            tooltip.classList.remove('visible');
        });

        // Обновляем позицию при скролле
        window.addEventListener('scroll', function() {
            if (tooltip.classList.contains('visible')) {
                positionTooltip();
            }
        });

        // Обновляем позицию при изменении размера окна
        window.addEventListener('resize', function() {
            if (tooltip.classList.contains('visible')) {
                positionTooltip();
            }
        });
    });
});
