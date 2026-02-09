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
        // High-frequency small increments for a linear "glide" effect
        progress += Math.random() * 0.8 + 0.2;
        if (progress > 100) progress = 100;
        progressBar.style.width = `${progress}%`;

        if (progress >= 100) {
            progress = 100;
            progressBar.style.width = '100%';
            clearInterval(interval);
            setTimeout(() => {
                splash.style.opacity = '0';
                setTimeout(() => splash.style.display = 'none', 800);
            }, 600);
        }
    }, 50);

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
