<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Child Aptitude Test Feedback (10–12 Years)</title>
  <link rel="stylesheet" href="css/styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Fredoka&family=Quicksand&display=swap" rel="stylesheet">
  <style>
    .body {
      font-family: 'Quicksand', sans-serif;
      background: linear-gradient(to right, #dbeafe, #fef9c3);
      display: flex;
      justify-content: center;
      padding: 50px;
    }

    .feedback-form {
      background: #fff;
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
      max-width: 800px;
      width: 100%;
      position: relative;
    }

    .feedback-form::before {
      content: '📝';
      font-size: 60px;
      position: absolute;
      top: -30px;
      left: -30px;
    }

    h2 {
      font-family: 'Fredoka', sans-serif;
      text-align: center;
      color: #1e3a8a;
      margin-bottom: 30px;
      font-size: 28px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-weight: 600;
      margin-bottom: 8px;
      color: #374151;
    }

    input[type="text"],
    input[type="email"],
    select,
    textarea {
      width: 100%;
      padding: 12px;
      border-radius: 10px;
      border: 2px solid #cbd5e1;
      font-size: 15px;
      box-sizing: border-box;
      background-color: #f9fafb;
    }

    textarea {
      resize: vertical;
    }

    select:focus,
    input:focus,
    textarea:focus {
      outline: none;
      border-color: #60a5fa;
      box-shadow: 0 0 5px rgba(96, 165, 250, 0.5);
    }

    .submit-btn {
      background: linear-gradient(to right, #34d399, #3b82f6);
      color: white;
      padding: 14px;
      border: none;
      border-radius: 12px;
      font-size: 17px;
      width: 100%;
      cursor: pointer;
      transition: transform 0.2s, box-shadow 0.2s;
    }

    .submit-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(59, 130, 246, 0.3);
    }

    .icon {
      margin-right: 6px;
    }
  </style>
</head>
<body>
<?php include 'includes/header.php'; ?>
<div class="body">

    <form class="feedback-form">
        <h2>🧠Feedback Form</h2>

        <div class="form-group">
            <label for="parentName">👨‍👩‍👧 Parent/Guardian Name *</label>
      <input type="text" id="parentName" name="parentName" required>
    </div>
    
    <div class="form-group">
        <label for="childName">🧒 Child's Name *</label>
        <input type="text" id="childName" name="childName" required>
    </div>
    
    <div class="form-group">
        <label for="email">📧 Email Address *</label>
      <input type="email" id="email" name="email" required>
    </div>

    <div class="form-group">
        <label for="level">📊 Overall difficulty of the test?</label>
        <select id="level" name="level">
            <option value="">Select</option>
            <option value="Too easy">Too Easy 😅</option>
            <option value="Balanced">Balanced ⚖</option>
            <option value="Somewhat Difficult">Somewhat Difficult 🤔</option>
            <option value="Very Challenging">Very Challenging 😵</option>
        </select>
    </div>
    
    <div class="form-group">
        <label for="time">⏰ Was the time sufficient?</label>
        <select id="time" name="time">
            <option value="">Select</option>
            <option value="Yes">Yes 👍</option>
        <option value="Almost enough">Almost enough ⏳</option>
        <option value="No, too short">No, too short 😬</option>
    </select>
</div>

<div class="form-group">
    <label for="engagement">🧠 Engagement during test?</label>
    <select id="engagement" name="engagement">
        <option value="">Select</option>
        <option value="Fully engaged">Fully Engaged 🥳</option>
        <option value="Moderately engaged">Moderately Engaged 🙂</option>
        <option value="Disengaged">Disengaged 😐</option>
    </select>
</div>

<div class="form-group">
    <label for="skills">🛠 Skills the test assessed well</label>
    <textarea id="skills" name="skills" rows="3" placeholder="e.g., Logical Reasoning, Math Solving, Pattern Recognition..."></textarea>
    </div>

    <div class="form-group">
      <label for="reaction">💬 Child’s feelings after the test</label>
      <textarea id="reaction" name="reaction" rows="3" placeholder="e.g., Confident, Curious, Anxious..."></textarea>
    </div>
    
    <div class="form-group">
        <label for="feedback">🧐 Specific questions your child mentioned</label>
        <textarea id="feedback" name="feedback" rows="3"></textarea>
    </div>
    
    <div class="form-group">
        <label for="suggestions">🎯 Suggestions to improve</label>
        <textarea id="suggestions" name="suggestions" rows="3"></textarea>
    </div>
    
    <div class="form-group">
        <label for="rating">🌟 Overall Rating</label>
        <select id="rating" name="rating">
            <option value="">Select</option>
            <option value="Excellent">Excellent 🌟</option>
            <option value="Good">Good 😊</option>
            <option value="Average">Average 😐</option>
            <option value="Poor">Poor 😞</option>
        </select>
    </div>

    <button type="submit" class="submit-btn">🚀 Submit Feedback</button>
</form>

</div>
<?php include 'includes/footer.php'; ?>

<script>
    // Add event listener for form submission
    document.getElementById('feedbackForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission

        // Simulate form submission (you can replace this with an AJAX request if needed)
        setTimeout(function() {
            alert('Your feedback has been submitted successfully!'); // Show popup message
            document.getElementById('feedbackForm').reset(); // Reset the form fields
        }, 500); // Simulate a delay for feedback submission
    });
</script>

</body>
</html>