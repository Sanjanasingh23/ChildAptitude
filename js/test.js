document.addEventListener('DOMContentLoaded', function() {
    // Test variables
    let currentTest = null;
    let currentQuestions = [];
    let currentQuestionIndex = 0;
    let userAnswers = [];

    // Get all category cards (assuming you have these)
    const categoryCards = document.querySelectorAll('.category-card');
    const testContainer = document.getElementById('test-interface');
    const resultsContainer = document.getElementById('results-page');

    // Overlay elements
    const testExitOverlay = document.getElementById('test-exit-overlay');
    const closeTestExit = document.getElementById('close-test-exit');
    const confirmTestExit = document.getElementById('confirm-test-exit');
    const cancelTestExit = document.getElementById('cancel-test-exit');

    // Add click event to each category card (if applicable)
    categoryCards.forEach(card => {
        const startButton = card.querySelector('.start-btn');
        if (startButton) {
            startButton.addEventListener('click', function() {
                const categoryId = card.getAttribute('data-age');
                startTest(categoryId);
            });
        }
    });

    // Function to start a test
    window.startTest = function(categoryId) {
        console.log('Starting test for category:', categoryId);

        // Add 'test-active' class to the body
        document.body.classList.add('test-active');

        fetch(`api/test_data.php?category=${encodeURIComponent(categoryId)}`)
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    if (!data.test || !data.test.questions || !Array.isArray(data.test.questions)) {
                        alert('No questions available for this test.');
                        return;
                    }

                    currentTest = data.test;
                    currentQuestions = data.test.questions;

                    // Hide categories section
                    const categoriesSection = document.getElementById('categories');
                    if (categoriesSection) {
                        categoriesSection.style.display = 'none';
                    }

                    displayTest();

                    // Show test container and add 'active' class
                    if (testContainer) {
                        testContainer.style.display = 'block';
                        testContainer.classList.add('active'); // Optional: Highlight
                        testContainer.scrollIntoView({
                            behavior: 'smooth'
                        });
                    }
                } else {
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred. Please try again later.');
            });
    };

    // Function to display the current question
    function displayTest() {
        const testHeader = testContainer.querySelector('.test-header');
        const questionContainer = testContainer.querySelector('.question-container');
        const navigationButtons = testContainer.querySelector('.navigation-buttons');

        // Update test header
        if (testHeader) {
            testHeader.innerHTML = `
                <h2>${currentTest.test_name}</h2>
                <p>Question <span id="current-question">${currentQuestionIndex + 1}</span> of <span id="total-questions">${currentQuestions.length}</span></p>
                <button class="nav-btn" id="exit-test-btn">Exit Test</button>
            `;
        }

        // Get current question
        const question = currentQuestions[currentQuestionIndex];

        // Update question content
        if (questionContainer) {
            questionContainer.innerHTML = `
                <p class="question">${question.question_text}</p>
                <div class="options">
                    ${question.options.map((option, index) => `
                        <div class="option ${userAnswers[currentQuestionIndex] === index ? 'selected' : ''}" data-index="${index}">
                            <p>${option.option_text}</p>
                            ${option.option_image ? `<img src="${option.option_image}" alt="Option ${index + 1}">` : ''}
                        </div>
                    `).join('')}
                </div>
            `;
        }

        // Add click event to options
        const options = questionContainer ? questionContainer.querySelectorAll('.option') : [];
        options.forEach(option => {
            option.addEventListener('click', function() {
                const index = parseInt(this.getAttribute('data-index'));
                userAnswers[currentQuestionIndex] = index;

                // Remove 'selected' class from all options
                options.forEach(opt => opt.classList.remove('selected'));

                // Add 'selected' class to clicked option
                this.classList.add('selected');
            });
        });

        // Update navigation buttons
        if (navigationButtons) {
            navigationButtons.innerHTML = `
                <button class="nav-btn ${currentQuestionIndex === 0 ? 'disabled' : ''}" id="prev-btn">Previous</button>
                <button class="nav-btn" id="${currentQuestionIndex === currentQuestions.length - 1 ? 'submit-btn' : 'next-btn'}">
                    ${currentQuestionIndex === currentQuestions.length - 1 ? 'Submit Test' : 'Next'}
                </button>
            `;
        }

        // Add click event to navigation buttons
        const prevBtn = navigationButtons ? navigationButtons.querySelector('#prev-btn') : null;
        if (prevBtn) {
            prevBtn.addEventListener('click', function() {
                if (currentQuestionIndex > 0) {
                    currentQuestionIndex--;
                    displayTest();
                }
            });
        }

        const nextBtn = navigationButtons ? navigationButtons.querySelector('#next-btn') : null;
        if (nextBtn) {
            nextBtn.addEventListener('click', function() {
                if (currentQuestionIndex < currentQuestions.length - 1) {
                    currentQuestionIndex++;
                    displayTest();
                }
            });
        }

        const submitBtn = navigationButtons ? navigationButtons.querySelector('#submit-btn') : null;
        if (submitBtn) {
            submitBtn.addEventListener('click', function() {
                // Check if all questions are answered
                const unanswered = userAnswers.findIndex(answer => answer === null);

                if (unanswered !== -1) {
                    if (confirm(`You haven't answered question ${unanswered + 1}. Do you want to go there now?`)) {
                        currentQuestionIndex = unanswered;
                        displayTest();
                        return;
                    }
                }

                // Submit test
                submitTest();
            });
        }

        // Add click event to the "Exit Test" button
        const exitTestBtn = document.getElementById('exit-test-btn');
        if (exitTestBtn) {
            exitTestBtn.addEventListener('click', showExitConfirmation);
        }
    }

    // Function to submit the test
    function submitTest() {
        // Prepare data to send
        const testData = {
            test_id: currentTest.test_id,
            answers: userAnswers.map((answerIndex, questionIndex) => {
                return {
                    question_id: currentQuestions[questionIndex].question_id,
                    selected_option_id: currentQuestions[questionIndex].options[answerIndex].option_id
                };
            })
        };

        console.log('Submitting Test Data:', testData);

        // Send data to server
        fetch('api/submit_test.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(testData),
            })
            .then(response => response.json())
            .then(data => {
                console.log('Submit Test Response:', data);

                if (data.success) {
                    // Hide test container
                    if (testContainer) {
                        testContainer.style.display = 'none';
                    }

                    // Display results
                    displayResults(data.results);

                    // Show results container
                    if (resultsContainer) {
                        resultsContainer.style.display = 'block';
                        resultsContainer.scrollIntoView({
                            behavior: 'smooth'
                        });
                    }
                } else {
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred. Please try again later.');
            });
    }

    // Function to display test results
    function displayResults(results) {
        if (!results || typeof results.score === 'undefined' || typeof results.max_score === 'undefined') {
            console.error('Error: Invalid results object:', results);
            alert('An error occurred while displaying the results.');
            return;
        }

        const resultsHeader = resultsContainer.querySelector('.results-header');
        const scoreDisplay = resultsContainer.querySelector('.score-display');
        const skillAnalysis = resultsContainer.querySelector('.skill-analysis');
        const actionButtons = resultsContainer.querySelector('.action-buttons');

        // Update results header
        if (resultsHeader) {
            resultsHeader.innerHTML = `
                <h2>Your Test Results</h2>
                <p>Great job completing the ${currentTest.test_name}!</p>
            `;
        }

        // Update score display
        const scorePercentage = (results.score / results.max_score) * 100;
        if (scoreDisplay) {
            scoreDisplay.innerHTML = `
                <h3>Your Score</h3>
                <div class="score-circle">${Math.round(scorePercentage)}%</div>
                <p>${getScoreMessage(scorePercentage)}</p>
            `;
        }

        // Update skill analysis
        if (skillAnalysis) {
            skillAnalysis.innerHTML = results.skills.map(skill => `
                <div class="skill-card">
                    <h4>${skill.skill_name}</h4>
                    <p>${skill.description}</p>
                    <div class="skill-progress">
                        <div class="progress-fill" style="width: ${skill.score}%;"></div>
                    </div>
                </div>
            `).join('');
        }

        // Update action buttons
        if (actionButtons) {
            actionButtons.innerHTML = `
                <button class="action-btn" id="retry-btn">Try Another Test</button>
                <button class="action-btn certificate-btn" id="certificate-btn">Get Certificate</button>
                <button class="action-btn" id="share-btn">Share Results</button>
            `;
        }

        // Add click event to action buttons
        const retryBtn = actionButtons ? actionButtons.querySelector('#retry-btn') : null;
        if (retryBtn) {
            retryBtn.addEventListener('click', function() {
                if (resultsContainer) {
                    resultsContainer.style.display = 'none';
                }
                const categoriesSection = document.getElementById('categories');
                if (categoriesSection) {
                    categoriesSection.style.display = 'block';
                    categoriesSection.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        }

        const certificateBtn = actionButtons ? actionButtons.querySelector('#certificate-btn') : null;
        if (certificateBtn) {
            certificateBtn.addEventListener('click', function() {
                window.open(`api/certificate.php?result_id=${results.result_id}`, '_blank');
            });
        }

        const shareBtn = actionButtons ? actionButtons.querySelector('#share-btn') : null;
        if (shareBtn) {
            shareBtn.addEventListener('click', function() {
                if (navigator.share) {
                    navigator.share({
                        title: 'My KidGenius Test Results',
                        text: `I scored ${Math.round(scorePercentage)}% on the ${currentTest.test_name}!`,
                        url: window.location.href,
                    });
                } else {
                    alert('Share feature is not available in your browser. You can take a screenshot instead!');
                }
            });
        }
    }

    // Helper function to get score message
    function getScoreMessage(score) {
        if (score >= 90) {
            return 'Outstanding performance! You\'re showing exceptional aptitude in several areas.';
        } else if (score >= 75) {
            return 'Excellent performance! You\'re showing great aptitude in several areas.';
        } else if (score >= 60) {
            return 'Good job! You\'re showing solid aptitude in several areas.';
        } else if (score >= 40) {
            return 'Nice effort! You\'re showing potential in some areas with room to grow.';
        } else {
            return 'Thanks for taking the test! We\'ve identified some areas where you can focus to improve.';
        }
    }

    // Check for category in URL and start test if present (if needed)
    const urlParams = new URLSearchParams(window.location.search);
    const category = urlParams.get('category');

    if (category) {
        startTest(category);
    }

    // --- Exit Test Logic (Option 1) ---

    // Function to show the exit confirmation overlay
    function showExitConfirmation() {
        if (testExitOverlay) {
            testExitOverlay.style.display = 'flex';
        }
    }

    // Event listeners for the overlay buttons
    if (closeTestExit) {
        closeTestExit.addEventListener('click', hideExitConfirmation);
    }

    if (cancelTestExit) {
        cancelTestExit.addEventListener('click', hideExitConfirmation);
    }

    if (confirmTestExit) {
        confirmTestExit.addEventListener('click', exitTest);
    }

    // Function to hide the exit confirmation overlay
    function hideExitConfirmation() {
        if (testExitOverlay) {
            testExitOverlay.style.display = 'none';
        }
    }

    // Function to handle the actual exit logic (Option 1)
    function exitTest() {
        console.log('Exiting test - discarding progress.');

        hideTestInterface();
        showCategories();
        clearTestData();

        hideExitConfirmation();

        // Remove 'test-active' class from the body
        document.body.classList.remove('test-active');
        if (testContainer) {
            testContainer.classList.remove('active'); // Optional: Remove highlight
        }
    }

    function hideTestInterface() {
        if (testContainer) {
            testContainer.style.display = 'none';
            testContainer.classList.remove('active'); // Optional: Remove highlight
        }
    }

    function showCategories() {
        const categoriesSection = document.getElementById('categories');
        if (categoriesSection) {
            categoriesSection.style.display = 'block';
            categoriesSection.scrollIntoView({
                behavior: 'smooth'
            });
        }
    }

    function clearTestData() {
        currentTest = null;
        currentQuestions = [];
        currentQuestionIndex = 0;
        userAnswers = [];
    }

    // --- End of Exit Test Logic ---
});