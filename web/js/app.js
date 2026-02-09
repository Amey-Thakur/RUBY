// Global Animation Function - Exposed immediately
window.animateStatsCard = function () {
    console.log("💎 Ruby Stats Animation Triggered");
    const milestoneCount = document.getElementById('milestone-count');
    const projectCount = document.getElementById('project-count');
    const masteryCount = document.getElementById('mastery-count');
    const iconElement = document.getElementById('stats-ruby-icon');

    if (!milestoneCount || !masteryCount || !iconElement) {
        console.error("Missing critical stats elements:", { milestoneCount, masteryCount, iconElement });
        return;
    }

    // Check if we are already animating
    if (window.isStatsAnimating) {
        console.log("Animation already in progress, skipping.");
        return;
    }
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
        console.log("Animation lock released");
    }, duration + 100);

    function animateValue(obj, start, end, duration, suffix = '') {
        let startTimestamp = null;
        const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const progress = Math.min((timestamp - startTimestamp) / duration, 1);
            const ease = 1 - Math.pow(1 - progress, 4); // Quartic Out for smoothness

            const current = Math.floor(ease * (end - start) + start);
            obj.innerText = current + suffix;

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
    if (projectCount) {
        animateValue(projectCount, 0, targetProjects, duration);
    }
    animateValue(masteryCount, 0, targetMastery, duration, '%');
};

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
    const eeOverlay = document.getElementById('easter-egg-overlay');

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
                    if (window.animateStatsCard) window.animateStatsCard(); // Trigger stats animation
                }, 800);
            }, 600);
        }
    }, 200);

    // Global Animation State
    window.isStatsAnimating = false;

    // Explicit Click Listener (Backup for inline onclick)
    const statsIcon = document.getElementById('stats-ruby-icon');
    if (statsIcon) {
        statsIcon.addEventListener('click', (e) => {
            e.stopPropagation();
            if (window.animateStatsCard) window.animateStatsCard();
        });
    }

    // 2. Filter Logic
    filterBtns.forEach(btn => {
        btn.onclick = () => {
            const filter = btn.dataset.filter;
            filterBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            document.querySelectorAll('.day-card').forEach(card => {
                if (filter === 'all' || card.dataset.category === filter) {
                    card.style.display = 'flex';
                } else {
                    card.style.display = 'none';
                }
            });
        };
    });

    // 3. High-Fidelity Archive Explorer
    const archiveModal = document.getElementById('archive-modal');
    const fileList = document.getElementById('file-list');
    const archiveCodeDisplay = document.getElementById('archive-code-display');
    const currentFileName = document.getElementById('current-file-name');
    const archiveTitle = document.getElementById('archive-title');
    const archivePath = document.getElementById('archive-path');
    const downloadBtn = document.getElementById('download-btn');
    const githubBtn = document.getElementById('github-link-btn');
    const archiveExecutionScript = document.getElementById('archive-execution-script');
    const fileCountBadge = document.getElementById('file-count-badge');

    // Toast Notification Helper
    function showToast(message) {
        let toast = document.querySelector('.toast-notification');
        if (!toast) {
            toast = document.createElement('div');
            toast.className = 'toast-notification';
            document.body.appendChild(toast);
        }
        toast.innerHTML = `<i class="fas fa-check-circle"></i> <span>${message}</span>`;

        // Trigger reflow
        void toast.offsetWidth;

        toast.classList.add('show');

        setTimeout(() => {
            toast.classList.remove('show');
        }, 3000);
    }

    // 3. Copy Code Button
    const copyBtn = document.getElementById('copy-code-btn');
    if (copyBtn) {
        copyBtn.onclick = () => {
            const codeContent = archiveCodeDisplay.textContent;
            // Use currentFileName.innerText as filename is not in this scope
            const currentFile = currentFileName.innerText || 'script.rb';

            const header = `# ==========================================\n` +
                `# 💎 Ruby Programming Challenge\n` +
                `# File:    ${currentFile}\n` +
                `# Authors: Amey Thakur & Mega Satish\n` +
                `# Repo:    https://github.com/Amey-Thakur/RUBY\n` +
                `# \n` +
                `# Profiles:\n` +
                `# - https://github.com/Amey-Thakur\n` +
                `# - https://github.com/msatmod\n` +
                `# ==========================================\n\n`;

            const fullText = header + codeContent;

            navigator.clipboard.writeText(fullText).then(() => {
                showToast('Code copied to clipboard!');
            }).catch(err => {
                console.error('Copy failed:', err);
                alert('Failed to copy code.');
            });
        };
    }

    let activeDayFiles = [];
    let activeDayFolder = "";

    window.openArchiveExplorer = async function (day) {
        try {
            const card = document.querySelector(`.day-card[onclick*="openArchiveExplorer(${day})"]`);
            if (!card) {
                return;
            }

            if (!card.dataset.files || !card.dataset.folder) {
                console.error('Missing data attributes on card.');
                return;
            }

            activeDayFiles = JSON.parse(card.dataset.files);
            activeDayFolder = card.dataset.folder;
            const topic = card.querySelector('.day-title').innerText;

            archiveTitle.innerText = `Day ${day}: ${topic}`;
            archivePath.innerText = activeDayFolder;
            if (fileCountBadge) fileCountBadge.innerText = activeDayFiles.length;

            // Populate Sidebar
            fileList.innerHTML = '';
            activeDayFiles.forEach((file, index) => {
                const li = document.createElement('li');
                li.className = `file-item ${index === 0 ? 'active' : ''}`;
                const icon = file.endsWith('.rb') ? 'fab fa-ruby' : 'fas fa-file-alt';
                li.innerHTML = `<i class="${icon}"></i> <span>${file}</span>`;
                li.onclick = () => loadArchiveFile(file, li);
                fileList.appendChild(li);
            });

            archiveModal.style.display = 'flex';
            // Slight delay to allow display:flex to register            // Show Modal directly
            archiveModal.style.display = 'flex';

            // Force verify visibility just in case
            if (getComputedStyle(archiveModal).display === 'none') {
                archiveModal.setAttribute('style', 'display: flex !important;');
            }

            // Load first file by default
            if (activeDayFiles.length > 0) {
                loadArchiveFile(activeDayFiles[0]);
            }
        } catch (e) {
            console.error('Error opening archive:', e);
            alert('Failed to open archive. Please try again.');
        }
    };

    async function loadArchiveFile(filename, element = null) {
        if (element) {
            document.querySelectorAll('.file-item').forEach(li => li.classList.remove('active'));
            element.classList.add('active');
        }

        currentFileName.innerText = filename;
        const codeElement = archiveCodeDisplay.querySelector('code');
        if (codeElement) codeElement.textContent = "# Loading source code...";

        // Execution Hint - Hidden for non-ruby files
        if (archiveExecutionScript) {
            if (filename.endsWith('.rb')) {
                archiveExecutionScript.parentElement.style.display = 'flex';
                // USER REQUEST: Perfect spacing for "ruby filename"
                archiveExecutionScript.innerHTML = `&nbsp;${filename.replace('.rb', '')}`;
            } else {
                archiveExecutionScript.parentElement.style.display = 'none';
            }
        }

        const fullPath = `${activeDayFolder}/${filename}`;
        // The build script now syncs "Source Code" to "web/source"
        // Since app.js is in "web/js", we go up one and into "source"
        const relativePath = activeDayFolder.replace('Source Code/', '');
        const encodedRelativePath = relativePath.split('/').map(encodeURIComponent).join('/');
        const encodedFilename = encodeURIComponent(filename);
        const fetchUrl = `source/${encodedRelativePath}/${encodedFilename}?v=${new Date().getTime()}`;

        // GitHub URL (spaces encoded) - Case-Sensitive fix
        const githubUrl = `https://github.com/Amey-Thakur/RUBY/blob/main/Source%20Code/${encodedRelativePath}/${encodedFilename}`;

        try {
            const response = await fetch(fetchUrl);
            if (!response.ok) throw new Error(`HTTP ${response.status}`);
            const code = (await response.text()).trim();

            const codeElement = archiveCodeDisplay.querySelector('code');
            if (codeElement) {
                codeElement.textContent = code;
                if (window.Prism) Prism.highlightElement(codeElement);
            }

            // Update Dynamic Actions

            // 1. GitHub Button
            githubBtn.onclick = () => window.open(githubUrl, '_blank');

            // 2. Download Button
            downloadBtn.onclick = () => {
                const blob = new Blob([code], { type: 'text/plain' });
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = filename;
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
                window.URL.revokeObjectURL(url);
            };


        } catch (err) {
            console.error("Fetch Error:", err);
            const codeElement = archiveCodeDisplay.querySelector('code');
            if (codeElement) {
                codeElement.textContent = `# Error: Could not load the script.\n# Path: ${fetchUrl}\n# Details: ${err.message}`;
            }

            // Still enable GitHub button even if fetch fails
            githubBtn.onclick = () => window.open(githubUrl, '_blank');
        }
    }

    // Modal Close Button
    // (This block was redundant and removed to fix duplicate declaration error)

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
    let eeTimeout;
    const eeMessageBox = document.getElementById('ee-message-box');

    const secretMessages = {
        'amey': "The 100th breach has been logged. Beneath the layers of syntax, a crystalline pattern of pure logic has surfaced, a structure older than the first commit. The challenge hasn't just been solved; it's been understood. The Sacred Ruby remains in your custody.\n\n— Amey & Mega 💎",
        'mega': "Frequency Intercepted: The 'Secret Ruby' protocol is now fully transparent. What was once a collection of scripts is now recognized as a single, breathing entity of code. The rhythm of the machine is finally audible. The archive is yours to explore.\n\n— Amey & Mega 🥂",
        'ameymega': "The Unification Event has been documented. Two separate technical currents have converged to unlock the final seal of the Gem. It turns out the Sacred Ruby wasn't the goal; it was the lens through which we now view the machine.\n\nCheers to the collaborative masterpiece!\n— Amey & Mega 🥂💎"
    };

    document.addEventListener('keyup', (e) => {
        if (e.key === 'Escape') {
            document.body.classList.remove('easter-egg-active');
            typedBuffer = "";
            return;
        }

        // Ignore metadata keys (Shift, Ctrl, etc)
        if (e.key.length > 1) return;

        typedBuffer += e.key.toLowerCase();
        if (typedBuffer.length > 50) typedBuffer = typedBuffer.substring(typedBuffer.length - 50);

        // Debounce to allow full word completion (avoids 'amey' triggering before 'ameymega')
        clearTimeout(eeTimeout);
        eeTimeout = setTimeout(() => {
            const sortedKeys = Object.keys(secretMessages).sort((a, b) => b.length - a.length);
            for (const key of sortedKeys) {
                if (typedBuffer.endsWith(key)) {
                    eeMessageBox.innerText = secretMessages[key];
                    document.body.classList.add('easter-egg-active');
                    typedBuffer = "";
                    break;
                }
            }
        }, 400);
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
    if (themeToggle) {
        themeToggle.onclick = () => {
            const currentTheme = document.body.getAttribute('data-theme');
            const newTheme = currentTheme === 'light' ? 'dark' : 'light';
            document.body.setAttribute('data-theme', newTheme);
            themeToggle.innerHTML = newTheme === 'light' ? '<i class="fas fa-sun"></i>' : '<i class="fas fa-moon"></i>';
        };
    }

    // Hero Share Button
    const heroShareBtn = document.getElementById('share-btn');
    if (heroShareBtn) {
        heroShareBtn.onclick = async () => {
            const shareData = {
                title: 'Ruby Programming Challenge',
                text: "Check out this Ruby mastery journey by Amey & Mega! 💎",
                url: 'https://github.com/Amey-Thakur/RUBY'
            };

            // Consistent Pro Logic
            if (navigator.share && navigator.canShare && navigator.canShare(shareData)) {
                try {
                    await navigator.share(shareData);
                } catch (err) {
                    console.error('Error sharing:', err);
                }
            } else {
                // Fallback
                const shareText = `${shareData.text}\n\n${shareData.url}`;
                navigator.clipboard.writeText(shareText).then(() => {
                    alert('Native sharing unavailable (requires HTTPS/Mobile). Link copied!');
                }).catch(err => {
                    console.error('Failed to copy text: ', err);
                });
            }
        };
    }

    // 8. Footer Cinematic Ruby
    const footerRuby = document.querySelector('.footer-branding img');
    if (footerRuby) {
        footerRuby.style.cursor = 'pointer';
        footerRuby.onclick = (e) => {
            e.stopPropagation(); // Prevent immediate closure from universal click listener
            const signature = "A collaborative masterpiece by Amey & Mega.";
            const hints = "\n\nType the names of the architects to unlock the hidden rhythms of the machine. 'Amey', 'Mega', or the unified 'AmeyMega' await your command.";
            eeMessageBox.innerText = `The Archive has been acknowledged.\n\n${signature}${hints} 🥂💎`;
            document.body.classList.add('easter-egg-active');

            // Special Console Log
            console.log("%c💎 Mastery Acknowledged %c- Signature: Amey & Mega", "color: #ff1a75; font-weight: bold;", "color: #888;");
        };
    }

    // Modal Close Button
    const closeArchiveBtn = document.querySelector('.close-archive');
    if (closeArchiveBtn) {
        closeArchiveBtn.onclick = () => {
            archiveModal.classList.remove('show');
            setTimeout(() => { archiveModal.style.display = 'none'; }, 300); // 300ms matches CSS transition
        };
    }

    // 9. Universal Closure (Click & Key)
    window.addEventListener('click', (event) => {
        // Exit Archive Modal if clicking backdrop
        if (archiveModal && event.target === archiveModal) {
            archiveModal.classList.remove('show');
            setTimeout(() => { archiveModal.style.display = 'none'; }, 300);
        }
        // Exit Easter Egg if clicking ANYWHERE (Overlay itself or children)
        if (document.body.classList.contains('easter-egg-active')) {
            document.body.classList.remove('easter-egg-active');
        }
    });

    // Handle Escape key for both
    window.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            if (archiveModal && archiveModal.classList.contains('show')) {
                archiveModal.classList.remove('show');
                setTimeout(() => { archiveModal.style.display = 'none'; }, 300);
            }
            document.body.classList.remove('easter-egg-active');
        }
    });

    // 10. Scroll Interactions & Back to Top
    const revealElements = document.querySelectorAll('.reveal');
    const backToTopBtn = document.getElementById('back-to-top');

    const revealObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('active');
            }
        });
    }, { threshold: 0.1 });

    revealElements.forEach(el => revealObserver.observe(el));

    if (backToTopBtn) {
        window.addEventListener('scroll', () => {
            if (window.scrollY > 300) {
                backToTopBtn.classList.add('visible');
            } else {
                backToTopBtn.classList.remove('visible');
            }
        });

        backToTopBtn.onclick = () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        };
    }
});
