document.addEventListener('DOMContentLoaded', () => {
    const splash = document.getElementById('skeleton-loader');
    const progressBar = document.getElementById('splash-progress-bar');
    const dayGrid = document.getElementById('day-grid');
    const filterBtns = document.querySelectorAll('.filter-btn');
    const modal = document.getElementById('code-modal');
    const closeModal = document.querySelector('.close-modal');
    const codeDisplay = document.getElementById('code-display');
    const modalTitle = document.getElementById('modal-title');
    const modalTopic = document.getElementById('modal-topic');
    const executionScript = document.getElementById('execution-script');
    const externalLinkBtn = document.getElementById('external-link-btn');

    // 1. Splash Loader Animation
    let progress = 0;
    const interval = setInterval(() => {
        progress += Math.random() * 30;
        if (progress >= 100) {
            progress = 100;
            progressBar.style.width = '100%';
            clearInterval(interval);
            setTimeout(() => {
                splash.style.opacity = '0';
                setTimeout(() => {
                    splash.style.display = 'none';
                    animateStatsCard(); // Trigger stats animation when home screen appears
                }, 800);
            }, 600);
        }
    }, 200);

    // Global Animation State
    window.isStatsAnimating = false;

    window.animateStatsCard = function () {
        const milestoneCount = document.getElementById('milestone-count');
        const projectCount = document.getElementById('project-count');
        const masteryCount = document.getElementById('mastery-count');
        const iconElement = document.getElementById('stats-ruby-icon');

        if (!milestoneCount || !masteryCount || !iconElement) return;

        // Prevent overlap
        if (window.isStatsAnimating) return;
        window.isStatsAnimating = true;

        // Reset values immediately for a clean replay
        milestoneCount.innerText = '0';
        if (projectCount) projectCount.innerText = '0';
        masteryCount.innerText = '0%';
        iconElement.style.left = '0%';

        const targetMilestones = 30;
        const targetProjects = 3;
        const targetMastery = 100;
        const duration = 2500;

        // Release lock after animation
        setTimeout(() => {
            window.isStatsAnimating = false;
        }, duration + 100);

        function animateValue(obj, start, end, duration, suffix = '') {
            let startTimestamp = null;
            const step = (timestamp) => {
                if (!startTimestamp) startTimestamp = timestamp;
                const progress = Math.min((timestamp - startTimestamp) / duration, 1);
                const ease = 1 - Math.pow(1 - progress, 4); // Quartic Out for smoothness

                const current = Math.floor(ease * (end - start) + start);
                obj.innerHTML = current + suffix;

                if (obj === milestoneCount) {
                    iconElement.style.left = (ease * (end / 30) * 100) + '%';
                }

                if (progress < 1) {
                    window.requestAnimationFrame(step);
                }
            };
            window.requestAnimationFrame(step);
        }

        animateValue(milestoneCount, 0, targetMilestones, duration);
        animateValue(projectCount, 0, targetProjects, duration);
        animateValue(masteryCount, 0, targetMastery, duration, '%');
    };

    // 2. Render Curriculum Grid
    function renderGrid(filter = 'all') {
        dayGrid.innerHTML = '';
        const filteredData = filter === 'all' ? curriculumData : curriculumData.filter(d => d.category === filter);

        filteredData.forEach(item => {
            const card = document.createElement('div');
            card.className = 'day-card glass-panel';
            card.innerHTML = `
                <div class="day-number">Day ${item.day}</div>
                <div class="day-title">${item.topic}</div>
                <div class="day-footer">
                    <span class="category-tag">${item.category.toUpperCase()}</span>
                </div>
            `;
            card.onclick = () => openCodeViewer(item);
            dayGrid.appendChild(card);
        });
    }

    // 3. Filter Logic
    filterBtns.forEach(btn => {
        btn.onclick = () => {
            filterBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            renderGrid(btn.dataset.filter);
        };
    });

    // 4. Code Viewer Logic
    async function openCodeViewer(item) {
        modalTitle.innerText = `Day ${item.day} Source Code`;
        modalTopic.innerText = item.topic;
        codeDisplay.textContent = "# Loading source code from repository...";

        // Extract script name for execution hint
        const scriptName = item.file.split('/').pop().replace('.rb', '');
        executionScript.innerText = scriptName;

        modal.style.display = 'block';

        try {
            // Adjust path: index.html is in web/, files are in root/Source Code/
            const response = await fetch(`../${item.file}`);
            if (!response.ok) throw new Error('File not found');
            const code = await response.text();

            codeDisplay.textContent = code;
            Prism.highlightElement(codeDisplay);

            externalLinkBtn.onclick = () => {
                window.open(`https://github.com/Amey-Thakur/RUBY/blob/main/${item.file}`, '_blank');
            };
        } catch (err) {
            codeDisplay.textContent = `# Error: Could not load the script.\n# Path: ${item.file}\n# Verify the file exists in the repository.`;
        }
    }

    // 5. Modal Close
    closeModal.onclick = () => modal.style.display = 'none';
    window.onclick = (e) => { if (e.target === modal) modal.style.display = 'none'; };

    // 6. Institutional Security Features
    document.addEventListener('contextmenu', e => e.preventDefault());
    document.addEventListener('dragstart', e => e.preventDefault());

    document.addEventListener('keydown', e => {
        // Disable DevTools & Save shortcuts
        if (
            e.key === 'F12' ||
            (e.ctrlKey && e.shiftKey && (e.key === 'I' || e.key === 'J' || e.key === 'C')) ||
            (e.ctrlKey && (e.key === 'u' || e.key === 's' || e.key === 'p'))
        ) {
            e.preventDefault();
        }
    });

    // 7. Cinematic Easter Egg System
    let typedBuffer = "";
    const eeOverlay = document.getElementById('easter-egg-overlay');
    const eeMessageBox = document.getElementById('ee-message-box');

    const secretMessages = {
        'amey': "Welcome to the core logic, Amey. Your technical discipline and architectural vision have brought this Ruby challenge to its high-fidelity conclusion. The archive is ready.",
        'mega': "Access Granted, Mega. Your ability to synthesize complex concepts and drive progress through collaboration is the heartbeat of this project. Intellectual agility at its peak.",
        'ameymega': "Synchronization Complete. A testament to the power of collaborative engineering and mutual dedication. The Amey-Mega partnership has defined a new standard for Ruby mastery."
    };

    document.addEventListener('keyup', (e) => {
        if (e.key === 'Escape') {
            document.body.classList.remove('easter-egg-active');
            typedBuffer = "";
            return;
        }

        typedBuffer += e.key.toLowerCase();
        if (typedBuffer.length > 10) typedBuffer = typedBuffer.substring(typedBuffer.length - 10);

        for (const key in secretMessages) {
            if (typedBuffer.endsWith(key)) {
                eeMessageBox.innerText = secretMessages[key];
                document.body.classList.add('easter-egg-active');
                typedBuffer = "";
                break;
            }
        }
    });

    // Personalized Console Signature
    console.log(
        "%c💎 RUBY PROGRAMMING CHALLENGE %c\n\nAuthorship: Amey Thakur & Mega Satish\nProject Scope: Full-Stack Ruby Engineering\n\n%c\"A disciplined pursuit of technical excellence.\"",
        "color: #CC0000; font-size: 24px; font-weight: bold; text-shadow: 2px 2px 0px rgba(0,0,0,0.2);",
        "color: #a0a0a0; font-size: 16px;",
        "color: #ffffff; font-style: italic; font-size: 14px; background: #990000; padding: 2px 8px; border-radius: 4px;"
    );

    // Initial Render - Handled by Ruby ERB Template
    // renderGrid();

    // Theme Toggle (Simplified)
    const themeToggle = document.getElementById('theme-toggle');
    themeToggle.onclick = () => {
        const currentTheme = document.body.getAttribute('data-theme');
        const newTheme = currentTheme === 'light' ? 'dark' : 'light';
        document.body.setAttribute('data-theme', newTheme);
        themeToggle.innerHTML = newTheme === 'light' ? '<i class="fas fa-sun"></i>' : '<i class="fas fa-moon"></i>';
    };
});
