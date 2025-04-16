<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/contact.css">
    <link rel="stylesheet" href="css/styles.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
<?php include 'includes/header.php'; ?>
<div class="contact-body">

    <div class="contact-container">
        <div class="contact-item">
            <div class="contact-contact">
                <div class="contact-firsttext">Let's get in touch</div>
                <img class="contact-image" src="images/contact-image.png" alt="image">
                <div class="contact-social-links">
                    <span class="contact-secnd-text">
                        <p style="padding-left: 20px;">Contact with us </p>
                    </span>
                    <ul class="contact-social-media">
                        <li><a href="#"><i class='bx bxl-facebook'></i></a></li>
                        <li><a href="#"><i class='bx bxl-twitter'></i></a></li>
                        <li><a href="#"><i class='bx bxl-linkedin'></i></a></li>
                        <li><a href="#"><i class='bx bxl-youtube'></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="contact-submit-form">
                <h4 class="contact-third-text">Contact Us</h4>
                <form action="">
                    <div class="contact-box-items">
                        <label for="contact-name">Name: </label>
                        <input type="text" name="name" id="contact-name">
                    </div>
                    <div class="contact-box-items">
                        <label for="contact-email">Email: </label>
                        <input type="email" name="email" id="contact-email">
                    </div>
                    <div class="contact-box-items">
                        <label for="contact-phone">Phone: </label>
                        <input type="tel" name="phone" id="contact-phone">
                    </div>
                    <div class="contact-box-items">
                        <label for="contact-text">Message: </label>
                        <textarea name="textarea" id="contact-text" cols="30" rows="5"></textarea>
                    </div>
                    <div class="contact-box-items">
                        <button type="submit" class="contact-submit-button">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
    <?php include 'includes/footer.php'; ?>
</body>

</html>