<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Nutrição Sem Pressão</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Font for Typography -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Phosphor Icons (para ícones de app modernos) -->
    <script src="https://unpkg.com/@phosphor-icons/web"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f3f4f6; /* Gray-100 */
            color: #1f2937; /* Gray-800 */
            overscroll-behavior-y: none; /* Previne o bounce effect do scroll no mobile */
        }
        
        /* Ocultar scrollbar mas permitir scroll */
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        /* Utilitários de Gráfico */
        .chart-container {
            position: relative;
            width: 100%;
            height: 250px;
        }

        /* Animações de Transição de Tela */
        .view-section {
            display: none;
            animation: fadeIn 0.3s ease-in-out;
        }
        .view-section.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Estilo do Bottom Nav */
        .nav-item.active {
            color: #2ecc71;
        }
        .nav-item.active i {
            font-weight: fill; /* Ícones Phosphor preenchidos quando ativos */
        }
    </style>
</head>
<body class="h-screen w-full flex flex-col overflow-hidden bg-gray-50">

    <!-- APP SHELL: Top Bar -->
    <header class="bg-white shadow-sm z-20 px-4 py-3 flex justify-between items-center flex-shrink-0">
        <div class="flex items-center gap-2">
            <div class="w-8 h-8 bg-green-100 rounded-full flex items-center justify-center text-green-600">
                <i class="ph ph-plant text-xl"></i>
            </div>
            <h1 class="text-lg font-bold text-gray-800 tracking-tight">Nutrição App</h1>
        </div>
        <button class="text-gray-400 hover:text-green-500">
            <i class="ph ph-gear text-2xl"></i>
        </button>
    </header>

    <!-- MAIN CONTENT AREA (Scrollable) -->
    <main id="app-content" class="flex-1 overflow-y-auto no-scrollbar p-4 pb-24 relative">
        
        <!-- VIEW 1: HOME (Dashboard) -->
        <div id="view-home" class="view-section active space-y-4">
            <!-- Greeting Card -->
            <div class="bg-gradient-to-r from-[#2ecc71] to-[#3498db] rounded-2xl p-6 text-white shadow-lg">
                <h2 class="text-2xl font-bold mb-1">Olá! 👋</h2>
                <p class="text-white/90 text-sm mb-4">Pronto para ouvir seu corpo hoje?</p>
                <div class="flex gap-2">
                    <button onclick="switchTab('tools')" class="bg-white/20 hover:bg-white/30 backdrop-blur-sm px-4 py-2 rounded-lg text-xs font-bold transition">
                        Checar Fome
                    </button>
                    <button onclick="switchTab('pillars')" class="bg-white text-[#2ecc71] px-4 py-2 rounded-lg text-xs font-bold shadow transition">
                        Ler Pilares
                    </button>
                </div>
            </div>

            <!-- Stats Card (Radar) -->
            <div class="bg-white p-4 rounded-2xl shadow-sm border border-gray-100">
                <div class="flex justify-between items-center mb-2">
                    <h3 class="font-bold text-gray-700">Seu Equilíbrio</h3>
                    <span class="text-xs bg-green-100 text-green-700 px-2 py-1 rounded-full">Atualizado</span>
                </div>
                <div class="chart-container">
                    <canvas id="radarChart"></canvas>
                </div>
            </div>

            <!-- Mini Tips Horizontal Scroll -->
            <div>
                <h3 class="font-bold text-gray-700 mb-2 px-1">Dicas Rápidas</h3>
                <div class="flex gap-3 overflow-x-auto no-scrollbar pb-2">
                    <div class="min-w-[140px] bg-orange-50 p-3 rounded-xl border border-orange-100">
                        <i class="ph ph-fork-knife text-orange-500 text-xl mb-1"></i>
                        <p class="text-xs font-semibold text-gray-700">Solte os talheres</p>
                        <p class="text-[10px] text-gray-500">Mastigue devagar.</p>
                    </div>
                    <div class="min-w-[140px] bg-blue-50 p-3 rounded-xl border border-blue-100">
                        <i class="ph ph-drop text-blue-500 text-xl mb-1"></i>
                        <p class="text-xs font-semibold text-gray-700">Hidrate-se</p>
                        <p class="text-[10px] text-gray-500">Água ajuda na saciedade.</p>
                    </div>
                    <div class="min-w-[140px] bg-purple-50 p-3 rounded-xl border border-purple-100">
                        <i class="ph ph-smiley text-purple-500 text-xl mb-1"></i>
                        <p class="text-xs font-semibold text-gray-700">Sem Culpa</p>
                        <p class="text-[10px] text-gray-500">Comida é energia.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- VIEW 2: PILARES (Education) -->
        <div id="view-pillars" class="view-section space-y-4">
            <h2 class="text-xl font-bold text-gray-800">Os 3 Pilares</h2>
            
            <!-- Comparison Chart -->
            <div class="bg-white p-4 rounded-2xl shadow-sm">
                <h4 class="font-bold text-sm text-gray-500 mb-2 uppercase tracking-wide">Dieta vs. Intuição</h4>
                <div class="chart-container" style="height: 200px;">
                    <canvas id="pillarsChart"></canvas>
                </div>
                <p class="mt-2 text-xs text-center text-gray-400">Dados comparativos de bem-estar</p>
            </div>

            <!-- Cards -->
            <div class="space-y-3">
                <div class="bg-white p-4 rounded-xl border-l-4 border-green-500 shadow-sm flex items-start gap-3">
                    <div class="bg-green-100 p-2 rounded-lg text-green-600"><i class="ph ph-hamburger text-xl"></i></div>
                    <div>
                        <h4 class="font-bold text-sm">1. Honre a Fome</h4>
                        <p class="text-xs text-gray-500 mt-1">Sinais físicos são sagrados. Não espere doer.</p>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-xl border-l-4 border-red-500 shadow-sm flex items-start gap-3">
                    <div class="bg-red-100 p-2 rounded-lg text-red-600"><i class="ph ph-hand-palm text-xl"></i></div>
                    <div>
                        <h4 class="font-bold text-sm">2. Respeite a Saciedade</h4>
                        <p class="text-xs text-gray-500 mt-1">Pare quando estiver confortável, não cheio.</p>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-xl border-l-4 border-blue-500 shadow-sm flex items-start gap-3">
                    <div class="bg-blue-100 p-2 rounded-lg text-blue-600"><i class="ph ph-peace text-xl"></i></div>
                    <div>
                        <h4 class="font-bold text-sm">3. Pazes com a Comida</h4>
                        <p class="text-xs text-gray-500 mt-1">Nenhum alimento é proibido. Adeus culpa.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- VIEW 3: TOOLS (Hunger Scale & Steps) -->
        <div id="view-tools" class="view-section space-y-4">
            <h2 class="text-xl font-bold text-gray-800">Ferramentas</h2>

            <!-- Hunger Scale Card -->
            <div class="bg-white p-5 rounded-2xl shadow-sm">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="font-bold text-gray-700">Escala da Fome</h3>
                    <button class="text-xs bg-gray-100 px-2 py-1 rounded text-gray-500">Hoje</button>
                </div>
                <div class="chart-container" style="height: 220px;">
                    <canvas id="hungerScaleChart"></canvas>
                </div>
                <div class="mt-4 grid grid-cols-3 gap-2 text-center">
                    <div class="bg-red-50 rounded p-2 border border-red-100">
                        <div class="text-lg">😫</div>
                        <div class="text-[10px] font-bold text-red-600">Fome</div>
                    </div>
                    <div class="bg-green-50 rounded p-2 border border-green-100">
                        <div class="text-lg">😌</div>
                        <div class="text-[10px] font-bold text-green-600">Ideal</div>
                    </div>
                    <div class="bg-orange-50 rounded p-2 border border-orange-100">
                        <div class="text-lg">🤢</div>
                        <div class="text-[10px] font-bold text-orange-600">Cheio</div>
                    </div>
                </div>
            </div>

            <!-- Mindfulness Steps (Vertical Timeline for Mobile) -->
            <div class="bg-white p-5 rounded-2xl shadow-sm">
                <h3 class="font-bold text-gray-700 mb-4">Ritual de Atenção Plena</h3>
                <div class="relative pl-4 border-l-2 border-gray-100 space-y-6">
                    <!-- Step 1 -->
                    <div class="relative pl-4">
                        <div class="absolute -left-[21px] top-0 bg-blue-500 w-4 h-4 rounded-full border-2 border-white shadow"></div>
                        <h4 class="font-bold text-sm text-gray-800">1. Check-in</h4>
                        <p class="text-xs text-gray-500">Qual minha nota de fome (1-10)? É física ou emocional?</p>
                    </div>
                    <!-- Step 2 -->
                    <div class="relative pl-4">
                        <div class="absolute -left-[21px] top-0 bg-green-500 w-4 h-4 rounded-full border-2 border-white shadow"></div>
                        <h4 class="font-bold text-sm text-gray-800">2. Ambiente</h4>
                        <p class="text-xs text-gray-500">Desligue telas. Respire fundo. Observe o prato.</p>
                    </div>
                    <!-- Step 3 -->
                    <div class="relative pl-4">
                        <div class="absolute -left-[21px] top-0 bg-orange-500 w-4 h-4 rounded-full border-2 border-white shadow"></div>
                        <h4 class="font-bold text-sm text-gray-800">3. Comer</h4>
                        <p class="text-xs text-gray-500">Pouse os talheres entre garfadas. Sinta a textura.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- VIEW 4: PROGRESS (Charts) -->
        <div id="view-progress" class="view-section space-y-4">
            <h2 class="text-xl font-bold text-gray-800">Seu Progresso</h2>

            <!-- Anxiety Chart -->
            <div class="bg-white p-4 rounded-2xl shadow-sm">
                <h4 class="font-bold text-sm text-gray-700 mb-2">Redução de Ansiedade</h4>
                <div class="chart-container">
                    <canvas id="anxietyChart"></canvas>
                </div>
            </div>

            <!-- Peace Pie Chart -->
            <div class="bg-white p-4 rounded-2xl shadow-sm">
                <h4 class="font-bold text-sm text-gray-700 mb-2">Foco Mental Atual</h4>
                <div class="chart-container" style="height: 200px;">
                    <canvas id="peaceChart"></canvas>
                </div>
                <div class="mt-4 text-xs text-gray-500 text-center">
                    Você agora gasta mais energia vivendo do que controlando comida.
                </div>
            </div>
        </div>

    </main>

    <!-- BOTTOM NAVIGATION BAR (Fixed) -->
    <nav class="bg-white border-t border-gray-200 fixed bottom-0 w-full z-30 pb-safe">
        <div class="grid grid-cols-4 h-16">
            <button onclick="switchTab('home')" class="nav-item active flex flex-col items-center justify-center text-gray-400 hover:text-green-500 transition" id="nav-home">
                <i class="ph ph-house text-2xl mb-0.5"></i>
                <span class="text-[10px] font-medium">Início</span>
            </button>
            <button onclick="switchTab('pillars')" class="nav-item flex flex-col items-center justify-center text-gray-400 hover:text-green-500 transition" id="nav-pillars">
                <i class="ph ph-book-bookmark text-2xl mb-0.5"></i>
                <span class="text-[10px] font-medium">Aprender</span>
            </button>
            <button onclick="switchTab('tools')" class="nav-item flex flex-col items-center justify-center text-gray-400 hover:text-green-500 transition" id="nav-tools">
                <i class="ph ph-wrench text-2xl mb-0.5"></i>
                <span class="text-[10px] font-medium">Ferramentas</span>
            </button>
            <button onclick="switchTab('progress')" class="nav-item flex flex-col items-center justify-center text-gray-400 hover:text-green-500 transition" id="nav-progress">
                <i class="ph ph-chart-line-up text-2xl mb-0.5"></i>
                <span class="text-[10px] font-medium">Evolução</span>
            </button>
        </div>
    </nav>

    <!-- LOGIC -->
    <script>
        // --- APP NAVIGATION LOGIC ---
        function switchTab(tabId) {
            // 1. Hide all views
            document.querySelectorAll('.view-section').forEach(el => {
                el.classList.remove('active');
            });
            // 2. Deactivate all nav buttons
            document.querySelectorAll('.nav-item').forEach(el => {
                el.classList.remove('active', 'text-green-500');
                el.classList.add('text-gray-400');
            });

            // 3. Show selected view
            const view = document.getElementById(`view-${tabId}`);
            if(view) view.classList.add('active');

            // 4. Activate nav button
            const navBtn = document.getElementById(`nav-${tabId}`);
            if(navBtn) {
                navBtn.classList.add('active', 'text-green-500');
                navBtn.classList.remove('text-gray-400');
            }

            // 5. Scroll to top for new view feel
            document.getElementById('app-content').scrollTop = 0;
        }


        // --- CHART JS SETUP (Same logic, adjusted configs for mobile) ---
        
        // Label Wrapping Function
        function splitLabel(label) {
            if (label.length > 12) { // Shorter for mobile
                return label.match(/.{1,12}/g);
            }
            return label;
        }

        const commonOptions = {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        boxWidth: 10,
                        font: { size: 10, family: 'Poppins' }
                    }
                }
            }
        };

        // 1. RADAR (Home)
        new Chart(document.getElementById('radarChart'), {
            type: 'radar',
            data: {
                labels: ["Sustentável", "Corpo", "Energia", "Prazer", "Mente"],
                datasets: [{
                    label: 'Atual',
                    data: [90, 85, 80, 95, 90],
                    fill: true,
                    backgroundColor: 'rgba(46, 204, 113, 0.2)',
                    borderColor: '#2ecc71',
                    pointRadius: 0
                }]
            },
            options: {
                ...commonOptions,
                scales: {
                    r: {
                        ticks: { display: false },
                        grid: { color: '#f3f4f6' }
                    }
                },
                plugins: { legend: { display: false } }
            }
        });

        // 2. PILLARS (Learn)
        new Chart(document.getElementById('pillarsChart'), {
            type: 'bar',
            data: {
                labels: ["Fome", "Saciedade", "Pazes"],
                datasets: [
                    { label: 'Intuitivo', data: [90, 85, 95], backgroundColor: '#2ecc71', borderRadius: 4 },
                    { label: 'Dieta', data: [20, 30, 15], backgroundColor: '#e74c3c', borderRadius: 4 }
                ]
            },
            options: {
                ...commonOptions,
                scales: { y: { display: false }, x: { grid: { display: false } } }
            }
        });

        // 3. HUNGER SCALE (Tools)
        new Chart(document.getElementById('hungerScaleChart'), {
            type: 'bar',
            data: {
                labels: ["1-2", "3-4", "5", "6-7", "8-10"],
                datasets: [{
                    label: 'Intensidade',
                    data: [9, 6, 5, 7, 10],
                    backgroundColor: ['#e74c3c', '#2ecc71', '#f1c40f', '#2ecc71', '#e67e22'],
                    borderRadius: 4
                }]
            },
            options: {
                indexAxis: 'y',
                ...commonOptions,
                plugins: { legend: { display: false } },
                scales: { x: { display: false }, y: { grid: { display: false } } }
            }
        });

        // 4. ANXIETY (Progress)
        new Chart(document.getElementById('anxietyChart'), {
            type: 'line',
            data: {
                labels: ["M1", "M3", "M6", "1A"],
                datasets: [{
                    label: 'Ansiedade',
                    data: [80, 60, 40, 20],
                    borderColor: '#2ecc71',
                    backgroundColor: 'rgba(46, 204, 113, 0.1)',
                    fill: true,
                    tension: 0.4,
                    pointRadius: 3
                }]
            },
            options: commonOptions
        });

        // 5. PEACE PIE (Progress)
        new Chart(document.getElementById('peaceChart'), {
            type: 'doughnut',
            data: {
                labels: ["Prazer", "Social", "Saúde", "Culpa"],
                datasets: [{
                    data: [40, 30, 25, 5],
                    backgroundColor: ['#f39c12', '#3498db', '#2ecc71', '#e74c3c'],
                    borderWidth: 0
                }]
            },
            options: {
                ...commonOptions,
                cutout: '70%',
                plugins: { legend: { position: 'right', labels: { boxWidth: 10, font: { size: 10 } } } }
            }
        });

    </script>
</body>
</html>
