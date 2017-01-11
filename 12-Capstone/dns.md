# DNS with Amazon Route 53

## Learning Goals

By the end of this lesson you should be able to:

-
-


## The Jargon

- ### IP Addresses
  Devices that are connected to the internet need a way to know how to direct communication between each other.  

  Much like we have phone numbers and street addresses, devices connected to the internet have IP Addresses.

  "IP" is short for Internet Protocol


- ### Domain Name
  The name, such as example.com, that a user types in the address bar of a web browser to access a website or a web application.


## What Is DNS?

DNS is a hierarchical system of computers and databases, that maps IP addresses to domain names.

It enables Internet users to connect human-language locations on the Internet with numeric addresses used by IP

For example, www.amazon.com would translate to a machine readable IP address, like 192.0.2.44

[Click Here to Read More](https://aws.amazon.com/route53/what-is-dns/)


## What is Amazon Route 53?
Amazon Route 53 performs three main functions:

- **[Register domain names](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-domain-registration.html):**
- **[Route Internet traffic to the resources for your domain](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-dns-service.html):**
- **[Check the health of your resources](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-health-checks.html):**

[Click Here to Read More About Amazon Route 53](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)


## Configuring Amazon Route 53 as Your DNS Service

You can registered a domain name directly from Amazon. If you do, it will automatically configure to Amazon Route 53 as your DNS Service.

If you have registered a domain from another service


- Go to: https://console.aws.amazon.com/route53/home

- Click the 'Get Started Now' button under DNS Management

- Click the 'Create Hosted Zone' button



## Additional Resources
- [Amazon Route 53 Documentation](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)
- [Getting Started Guide](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/getting-started.html)
