// Общая функциональность для модальных окон обучения (onboarding tour)

class OnboardingTour {
    constructor(steps, tourKey) {
        this.steps = steps;
        this.tourKey = tourKey;
        this.currentStep = 0;
        this.isOpen = false;
        this.overlay = null;
        this.modal = null;
        this.triggerButton = null;

        this.init();
    }

    init() {
        this.createTriggerButton();
        this.createModal();

        // Проверяем, видел ли пользователь этот тур
        const hasSeenTour = localStorage.getItem(`tour-${this.tourKey}-completed`);
        if (!hasSeenTour) {
            // Автоматически открываем тур через 500мс
            setTimeout(() => this.open(), 500);
        }
    }

    createTriggerButton() {
        // Создаем кнопку запуска тура (справа внизу)
        this.triggerButton = document.createElement('button');
        this.triggerButton.className = 'onboarding-trigger';
        this.triggerButton.innerHTML = `
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="10"></circle>
                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                <line x1="12" y1="17" x2="12.01" y2="17"></line>
            </svg>
        `;
        this.triggerButton.title = 'Запустить обучение';
        this.triggerButton.addEventListener('click', () => this.restart());
        document.body.appendChild(this.triggerButton);
    }

    createModal() {
        // Создаем оверлей
        this.overlay = document.createElement('div');
        this.overlay.className = 'onboarding-overlay';
        this.overlay.addEventListener('click', () => this.skip());

        // Создаем модальное окно
        this.modal = document.createElement('div');
        this.modal.className = 'onboarding-modal';
        this.modal.innerHTML = `
            <button class="onboarding-close">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="18" y1="6" x2="6" y2="18"></line>
                    <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
            </button>
            <div class="onboarding-content">
                <div class="onboarding-step-badge"></div>
                <h3 class="onboarding-title"></h3>
                <p class="onboarding-description"></p>
            </div>
            <div class="onboarding-actions">
                <button class="onboarding-btn onboarding-btn-skip">Пропустить</button>
                <button class="onboarding-btn onboarding-btn-next">
                    <span class="onboarding-btn-text">Далее</span>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="9 18 15 12 9 6"></polyline>
                    </svg>
                </button>
            </div>
            <div class="onboarding-indicators"></div>
        `;

        // Добавляем обработчики событий
        this.modal.querySelector('.onboarding-close').addEventListener('click', () => this.skip());
        this.modal.querySelector('.onboarding-btn-skip').addEventListener('click', () => this.skip());
        this.modal.querySelector('.onboarding-btn-next').addEventListener('click', () => this.next());

        document.body.appendChild(this.overlay);
        document.body.appendChild(this.modal);
    }

    updateContent() {
        const step = this.steps[this.currentStep];

        // Обновляем бейдж с номером шага
        const badge = this.modal.querySelector('.onboarding-step-badge');
        badge.textContent = `Шаг ${this.currentStep + 1} из ${this.steps.length}`;

        // Обновляем заголовок и описание
        this.modal.querySelector('.onboarding-title').textContent = step.title;
        this.modal.querySelector('.onboarding-description').textContent = step.description;

        // Обновляем текст кнопки "Далее"
        const btnText = this.modal.querySelector('.onboarding-btn-text');
        btnText.textContent = this.currentStep < this.steps.length - 1 ? 'Далее' : 'Понятно!';

        // Обновляем индикаторы
        const indicators = this.modal.querySelector('.onboarding-indicators');
        indicators.innerHTML = '';
        for (let i = 0; i < this.steps.length; i++) {
            const indicator = document.createElement('div');
            indicator.className = 'onboarding-indicator' + (i === this.currentStep ? ' active' : '');
            indicators.appendChild(indicator);
        }
    }

    open() {
        this.isOpen = true;
        this.overlay.classList.add('visible');
        this.modal.classList.add('visible');
        this.triggerButton.style.display = 'none';
        this.updateContent();
    }

    close() {
        this.isOpen = false;
        this.overlay.classList.remove('visible');
        this.modal.classList.remove('visible');
        this.triggerButton.style.display = 'flex';
    }

    next() {
        if (this.currentStep < this.steps.length - 1) {
            this.currentStep++;
            this.updateContent();
        } else {
            this.complete();
        }
    }

    skip() {
        this.close();
        localStorage.setItem(`tour-${this.tourKey}-completed`, 'true');
    }

    complete() {
        this.close();
        localStorage.setItem(`tour-${this.tourKey}-completed`, 'true');
    }

    restart() {
        this.currentStep = 0;
        this.open();
    }
}

// Функция для инициализации тура на странице
function initOnboardingTour(steps, tourKey) {
    return new OnboardingTour(steps, tourKey);
}
