---
layout: default
---

<!-- contact form start -->
<section id="contact-form">
<div class="container">

<h1>Send SEOSAW an email:</h1>

	    <form action="https://getsimpleform.com/messages?form_api_token=c6baac8c11d563256e784a811567b6d7" class="contact" method="post">
            <input type='hidden' name='redirect_to' value='{{ site.url }}/success' />
		<div class="form-group">
         	  <div class="form-item">
		    <input type="text" class="form-control" name="name" placeholder="Your Name" required>
		  </div>
         	  <div class="form-item">
		    <input type="text" class="form-control" name="email" placeholder="Email Address" required>
		  </div>
         	  <div class="form-item">
		    <input type="text" class="form-control" name="subject" placeholder="Subject" required>
		  </div>
		</div>
		<div class="form-group">
         	  <div class="form-item">
		    <textarea class="form-text" rows="3" name="content" placeholder="Your Message" required></textarea>
		  </div>
		    <button class="btn btn-default" type="submit">Send Message</button>
		</div>
	    </form>
</div>
</section>
