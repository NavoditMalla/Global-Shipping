<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Global Shipping</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Consistent with existing styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            color: #fefefe;
            background-color: #222132;
            line-height: 1.6;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* Top Navigation */
        .top-nav {
            background-color: #1a1927;
            color: #fefefe;
            padding: 8px 0;
            font-size: 0.9rem;
        }

        .top-nav .nav-links {
            display: flex;
            list-style: none;
            justify-content: flex-end;
            align-items: center;
        }

        .top-nav .nav-links li {
            margin-left: 20px;
            position: relative;
        }

        .top-nav .nav-links a {
            color: #fefefe;
            transition: color 0.3s;
        }

        .top-nav .nav-links a:hover {
            color: #f7ac70;
        }

        .profile-area {
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: #2a273c;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .profile-area:hover {
            background-color: #3a3750;
        }
        .profile-icon {
            width: 30px;
            height: 30px;
            background-color: #f7ac70;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
            color: #222132;
            font-size: 1rem;
        }
        .username-text {
            color: #fefefe;
            font-weight: bold;
            font-size: 0.95rem;
        }

        /* Main Header */
        .main-header {
            background-color: #2a273c;
            padding: 15px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .main-header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo a {
            font-size: 1.8rem;
            font-weight: bold;
            color: #f7ac70;
            letter-spacing: -1px;
        }

        .main-nav ul {
            display: flex;
            list-style: none;
        }

        .main-nav li {
            margin-left: 25px;
        }

        .main-nav a {
            font-weight: bold;
            color: #fefefe;
            padding: 5px 0;
            position: relative;
        }

        .main-nav a:hover {
            color: #f7ac70;
        }

        /* Contact Section */
        .contact-section {
            padding: 80px 0;
            background: linear-gradient(135deg, #222132, #2a273c);
        }

        .contact-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .contact-header h1 {
            font-size: 2.5rem;
            color: #f7ac70;
            margin-bottom: 15px;
        }

        .contact-header p {
            font-size: 1.2rem;
            color: #ccc;
            max-width: 700px;
            margin: 0 auto;
        }

        .contact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            margin-top: 50px;
        }

        .contact-card {
            background-color: #1e1c2a;
            border-radius: 10px;
            padding: 40px 30px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
        }

        .contact-card h3 {
            font-size: 1.5rem;
            color: #f7ac70;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .contact-card p {
            color: #ccc;
            margin-bottom: 20px;
            font-size: 1.1rem;
        }

        .contact-info {
            margin-top: 20px;
        }

        .contact-info-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            color: #fefefe;
        }

        .contact-info-item i {
            margin-right: 15px;
            color: #f7ac70;
            font-size: 1.2rem;
            width: 24px;
            text-align: center;
        }

        .contact-form {
            grid-column: span 2;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #fefefe;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            background-color: #2a273c;
            border: 1px solid #444;
            border-radius: 5px;
            color: #fefefe;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            outline: none;
            border-color: #f7ac70;
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        .submit-btn {
            background-color: #f7ac70;
            color: #222132;
            border: none;
            padding: 12px 30px;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #e69c60;
        }

        /* Footer */
        .main-footer {
            background-color: #1a1927;
            color: white;
            padding: 40px 0 20px;
        }

        .footer-links {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }

        .footer-column {
            flex: 1;
            min-width: 200px;
            margin-bottom: 20px;
        }

        .footer-column h3 {
            margin-bottom: 15px;
            font-size: 1.1rem;
            color: #f7ac70;
        }

        .footer-column ul {
            list-style: none;
        }

        .footer-column li {
            margin-bottom: 8px;
        }

        .footer-column a {
            color: #ccc;
            transition: color 0.3s;
        }

        .footer-column a:hover {
            color: #f7ac70;
        }

        .copyright {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #444;
            color: #999;
            font-size: 0.9rem;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .contact-grid {
                grid-template-columns: 1fr;
            }
            
            .contact-form {
                grid-column: span 1;
            }
            
            .main-nav ul {
                flex-direction: column;
                gap: 10px;
            }
            
            .main-nav li {
                margin-left: 0;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Top Navigation Bar -->
    <nav class="top-nav">
        <div class="container">
            <ul class="nav-links">
                <li>
                    <a href="profile" style="text-decoration: none;">
                        <div class="profile-area">
                            <div class="profile-icon">U</div>
                            <div class="username-text">Username</div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Header with Logo -->
    <header class="main-header">
        <div class="container">
            <div class="logo">
                <a href="customer">Global Shipping</a>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="shippingrequest">Shipping</a></li>
                    <li><a href="usertrackparcel">Tracking</a></li>
                    <li><a href="contactus">Support</a></li>
                    <li><a href="logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Contact Section -->
    <section class="contact-section">
        <div class="container">
            <div class="contact-header">
                <h1>Contact Our Support Team</h1>
                <p>We're here to help you with any questions or concerns about your shipments. Reach out to us through any of the channels below or fill out the contact form.</p>
            </div>
            
            <div class="contact-grid">
                <div class="contact-card">
                    <h3><i class="fas fa-phone-alt"></i> Phone Support</h3>
                    <p>Our customer service team is available to assist you with any inquiries or issues you may have.</p>
                    
                    <div class="contact-info">
                        <div class="contact-info-item">
                            <i class="fas fa-globe"></i>
                            <span>International: +1 (555) 123-4567</span>
                        </div>
                        <div class="contact-info-item">
                            <i class="fas fa-phone"></i>
                            <span>Toll-Free: 1-800-GLOBAL-SHIP</span>
                        </div>
                        <div class="contact-info-item">
                            <i class="fas fa-clock"></i>
                            <span>Mon-Fri: 8:00 AM - 8:00 PM EST</span>
                        </div>
                    </div>
                </div>
                
                <div class="contact-card">
                    <h3><i class="fas fa-envelope"></i> Email Support</h3>
                    <p>Send us an email and we'll get back to you as soon as possible, typically within 24 hours.</p>
                    
                    <div class="contact-info">
                        <div class="contact-info-item">
                            <i class="fas fa-inbox"></i>
                            <span>General Inquiries: support@globalshipping.com</span>
                        </div>
                        <div class="contact-info-item">
                            <i class="fas fa-truck"></i>
                            <span>Shipping Issues: operations@globalshipping.com</span>
                        </div>
                        <div class="contact-info-item">
                            <i class="fas fa-file-invoice-dollar"></i>
                            <span>Billing: billing@globalshipping.com</span>
                        </div>
                    </div>
                </div>
                
                <div class="contact-card contact-form">
                    <h3><i class="fas fa-comment-dots"></i> Send Us a Message</h3>
                    <p>Fill out the form below and we'll respond to your inquiry as quickly as possible.</p>
                    
                    <form action="#" method="POST">
                        <div class="form-group">
                            <label for="name">Your Name</label>
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="subject">Subject</label>
                            <select id="subject" name="subject" class="form-control" required>
                                <option value="">Select a subject</option>
                                <option value="shipping">Shipping Inquiry</option>
                                <option value="tracking">Tracking Issue</option>
                                <option value="billing">Billing Question</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="message">Your Message</label>
                            <textarea id="message" name="message" class="form-control" required></textarea>
                        </div>
                        
                        <button type="submit" class="submit-btn">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="main-footer">
        <div class="container">
            <div class="footer-links">
                <div class="footer-column">
                    <h3>Shipping Services</h3>
                    <ul>
                        <li><a href="#">Domestic Shipping</a></li>
                        <li><a href="#">International Shipping</a></li>
                        <li><a href="#">Same Day Delivery</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Support</h3>
                    <ul>
                        <li><a href="contactus">Contact Us</a></li>
                        <li><a href="#">FAQs</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Company</h3>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                    </ul>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; 2025 Global Shipping. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>