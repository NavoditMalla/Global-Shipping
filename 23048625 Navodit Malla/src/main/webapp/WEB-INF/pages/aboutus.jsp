<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Global Shipping</title>
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

        /* About Section */
        .about-section {
            padding: 80px 0;
            background: linear-gradient(135deg, #222132, #2a273c);
        }

        .about-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .about-header h1 {
            font-size: 2.5rem;
            color: #f7ac70;
            margin-bottom: 15px;
        }

        .about-header p {
            font-size: 1.2rem;
            color: #ccc;
            max-width: 700px;
            margin: 0 auto;
        }

        .about-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            align-items: center;
        }

        .about-text {
            color: #ccc;
        }

        .about-text h2 {
            font-size: 1.8rem;
            color: #f7ac70;
            margin-bottom: 20px;
        }

        .about-text p {
            margin-bottom: 20px;
            font-size: 1.1rem;
            line-height: 1.7;
        }

        .about-image {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        .about-image img {
            width: 100%;
            height: auto;
            display: block;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-top: 60px;
        }

        .stat-card {
            background-color: #1e1c2a;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #f7ac70;
            margin-bottom: 10px;
        }

        .stat-label {
            font-size: 1rem;
            color: #ccc;
        }

        .team-section {
            margin-top: 80px;
        }

        .team-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .team-header h2 {
            font-size: 2rem;
            color: #f7ac70;
            margin-bottom: 15px;
        }

        .team-header p {
            font-size: 1.1rem;
            color: #ccc;
            max-width: 600px;
            margin: 0 auto;
        }

        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .team-card {
            background-color: #1e1c2a;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .team-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
        }

        .team-image {
            height: 250px;
            overflow: hidden;
        }

        .team-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .team-info {
            padding: 20px;
            text-align: center;
        }

        .team-name {
            font-size: 1.3rem;
            color: #fefefe;
            margin-bottom: 5px;
        }

        .team-position {
            font-size: 1rem;
            color: #f7ac70;
            margin-bottom: 10px;
        }

        .team-bio {
            font-size: 0.9rem;
            color: #ccc;
            margin-bottom: 15px;
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
            .about-content {
                grid-template-columns: 1fr;
            }
            
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
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

    <!-- About Section -->
    <section class="about-section">
        <div class="container">
            <div class="about-header">
                <h1>About Global Shipping</h1>
                <p>Delivering excellence worldwide since 2010. We connect businesses and individuals across borders with reliable, fast, and secure shipping solutions.</p>
            </div>
            
            <div class="about-content">
                <div class="about-text">
                    <h2>Our Story</h2>
                    <p>Founded in 2010 with just three employees and a single warehouse, Global Shipping has grown into an international logistics leader with operations in over 50 countries. What started as a local courier service has transformed into a global network of shipping excellence.</p>
                    
                    <p>Our mission is simple: to make international shipping as seamless as domestic delivery. We've invested heavily in technology and infrastructure to ensure your packages arrive safely and on time, every time.</p>
                    
                    <h2>Our Values</h2>
                    <p>At Global Shipping, we operate on three core principles: reliability, transparency, and customer focus. These values guide every decision we make and every package we deliver.</p>
                    
                    <p>We believe in sustainable growth and responsible logistics. That's why we've implemented eco-friendly packaging solutions and optimized delivery routes to reduce our carbon footprint.</p>
                </div>
                
               
            </div>
            
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-number">13+</div>
                    <div class="stat-label">Years in Business</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">50+</div>
                    <div class="stat-label">Countries Served</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">2M+</div>
                    <div class="stat-label">Packages Delivered</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">98.7%</div>
                    <div class="stat-label">On-Time Rate</div>
                </div>
            </div>
            
            <div class="team-section">
                <div class="team-header">
                    <h2>Meet Our Leadership</h2>
                    <p>The dedicated professionals who steer Global Shipping towards continued success and innovation in logistics.</p>
                </div>
                
                <div class="team-grid">
                    <div class="team-card">
                        <div class="team-image">
                            <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="CEO">
                        </div>
                        <div class="team-info">
                            <h3 class="team-name">Michael Chen</h3>
                            <p class="team-position">CEO & Founder</p>
                            <p class="team-bio">Visionary leader with 20+ years in logistics. Founded Global Shipping to revolutionize international delivery.</p>
                        </div>
                    </div>
                    
                    <div class="team-card">
                        <div class="team-image">
                            <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5cd?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="COO">
                        </div>
                        <div class="team-info">
                            <h3 class="team-name">Sarah Johnson</h3>
                            <p class="team-position">Chief Operations Officer</p>
                            <p class="team-bio">Operations expert who ensures our global network runs smoothly and efficiently.</p>
                        </div>
                    </div>
                    
                    <div class="team-card">
                        <div class="team-image">
                            <img src="https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="CTO">
                        </div>
                        <div class="team-info">
                            <h3 class="team-name">David Park</h3>
                            <p class="team-position">Chief Technology Officer</p>
                            <p class="team-bio">Tech innovator driving our digital transformation and tracking systems.</p>
                        </div>
                    </div>
                    
                    <div class="team-card">
                        <div class="team-image">
                            <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="CFO">
                        </div>
                        <div class="team-info">
                            <h3 class="team-name">Emma Rodriguez</h3>
                            <p class="team-position">Chief Financial Officer</p>
                            <p class="team-bio">Financial strategist ensuring sustainable growth and investment in our future.</p>
                        </div>
                    </div>
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
                        <li><a href="aboutus">About Us</a></li>
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