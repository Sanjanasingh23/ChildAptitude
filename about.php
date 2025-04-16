<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - KidGenius</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
        }
    </style>
</head>
<body>
<?php include 'includes/header.php'; ?>
    <div class="bg-blue-50">

        <div class="container mx-auto px-4 py-16">
            <!-- Header Section -->
            <div class="text-center mb-16">
                <h1 class="text-4xl md:text-5xl font-bold text-blue-800 mb-4">About Us</h1>
            <p class="text-lg text-gray-600 max-w-2xl mx-auto">We’re a dedicated team of educators and innovators building Kids Genius—a child aptitude testing platform designed to help young minds uncover their strengths and reach their full potential..</p>
        </div>
        
        <!-- Team Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            <!-- Team Member 1 -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden transform transition duration-300 hover:scale-105">
                <img src="images/back.jpg" alt="Sarah Chen" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-gray-800 mb-2">Apeksha Tiwari</h3>
                    
                </div>
            </div>
            
            <!-- Team Member 2 -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden transform transition duration-300 hover:scale-105">
                <img src="images/back.jpg" alt="Maya Patel" class="w-full h-64 object-cover">
                <div class="p-4">
                    <h3 class="text-xl font-bold text-gray-800 mb-2">Ananya Jaiswal</h3>
                    
                </div>
            </div>
            
            <!-- Team Member 3 -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden transform transition duration-300 hover:scale-105">
                <img src="images/back.jpg" alt="Alex Thompson" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-gray-800 mb-2">Sanjana Singh</h3>
                    
                </div>
            </div>
            
            <!-- Team Member 4 -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden transform transition duration-300 hover:scale-105">
                <img src="images/back.jpg" alt="Dr. Emma Wilson" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-gray-800 mb-2">Banisha dhawan</h3>
                    
                    
                </div>
            </div>
        </div>
        
        <!-- Mission Statement -->
        <div class="mt-16 text-center bg-white rounded-xl shadow-lg p-8">
            <h2 class="text-3xl font-bold text-blue-800 mb-4">Our Mission</h2>
            <p class="text-lg text-gray-600 max-w-3xl mx-auto">
                At Kids Genius, we help children discover their strengths through fun and engaging aptitude tests. Our goal is to unlock their potential and spark a lifelong love for learning.
            </p>
        </div>
    </div>
</div>
<?php include 'includes/footer.php'; ?>
</body>
</html>